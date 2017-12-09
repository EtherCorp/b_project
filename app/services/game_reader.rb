class GameReader < IgdbReader
  def initialize
    super(Game)
    create_readers
    init_readers_data
    init_game_reader_options
    init_api_status
  end

  def init_api_status
    @api_status = ApiStatusManager.new(@connection.api.id)
    @api_status.new_status
    last_api_status = @api_status.last_api_processing
    add_filter 'created_at', 'gt', (last_api_status.created_at).strftime('%Q') if last_api_status
    #add_filter 'created_at', 'gt', (DateTime.now - 30).strftime('%Q')
  end

  # Create nested readers, using an internal mini-cache
  def create_readers
    @readers = {
      'developers' => { reader: IgdbReader.new(Company), rel: {} },
      'publishers' => { reader: IgdbReader.new(Company), rel: {} },
      'genres' => { reader: IgdbReader.new(Genre), rel: {} },
      'platforms' => { reader: IgdbReader.new(Platform), rel: {} }
    }
  end

  # Initialize values and parameters from readers
  def init_readers_data
    @readers['developers'][:reader].add_fields('/companies/', ['name'])
    @readers['publishers'][:reader].add_fields('/companies/', ['name'])
    @readers['genres'][:reader].add_fields('/genres/', ['name'])
    @readers['platforms'][:reader].add_fields('/platforms/', ['name'])
  end

  # Initialize particular parameters from game
  # Modifying this function, is possible change scope of this class
  def init_game_reader_options
    add_fields('/games/', ['name', 'alternative_names'] + @readers.keys)
    add_filter 'release_dates.platform', 'any', '48,49'
    add_scroll_pagination
  end

  # Overrided function, for extend functionality of reading data
  def process_step(url)
    data = super(url)
    @readers.each do |k, reader_str|
      process_each_key(data, reader_str, k)
      require_api_data(reader_str)
      # store_all_to_db
    end
    data
  rescue StandardError => ex
    @api_status.error_api(data_counts)
    raise ex
  end

  def data_counts
    counts = @readers.each_with_object({}) { |pair, hash| hash[pair[0]] = pair[1][:reader].cache.count }
    counts['games'] = @cache.cache_data.count
    counts
  end

  # Internal function, process each key data
  def process_each_key(data, reader_str, k)
    return if data.nil?
    data.body.each { |d| store_reader_ids(reader_str, d[k], d['id']) if d.key? k }
  end

  # Operate with ids of each reader associated
  def store_reader_ids(reader, ids_obt, game_id)
    ids_obt.each do |id|
      reader[:rel][id] ||= []
      reader[:rel][id] << game_id
    end
  end

  # Batch require, separated by 50 data only, in order of avoid pagination
  # Could return less than 50 elements (if data was cached)
  def require_api_data(reader_str)
    reader_str[:rel].keys.each_slice(50) do |keys|
      reader_str[:reader].process_by_id(keys)
    end
  end

  # Get data from inner reader
  def readers
    readers = @readers.each_with_object({}) { |pair, hash| hash[pair[0]] = pair[1][:reader] }
    readers['games'] = self
    readers
  end

  # Store data to db
  def store_to_db
    games_store = GamesStore.new
    games_store.store_to_db(cached, relations)
    @api_status.stored_api(data_counts)
  end

  # Returns cache data
  def cached
    data = {}
    @readers.each_key do |key|
      data[key] = @readers[key][:reader].cache
    end
    data['games'] = @cache
    data
  end

  # Returns relations of annexed data with games
  def relations
    @readers.each_with_object({}) { |pair, hash| hash[pair[0]] = pair[1][:rel] }
  end

  # Execute after proccess all games from IGDB API
  def post_proccess
    @api_status.received_api(data_counts)
    # store_to_db
  end
end
