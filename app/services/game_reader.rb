class GameReader < IgdbReader
  def initialize
    super(Game)
    create_readers
    init_readers_data
    init_game_reader_options
    create_api_status
  end

  # Create nested readers, using an internal mini-cache
  def create_readers
    @readers = {
      'developers' => { reader: IgdbReader.new('Company'), rel: {} },
      'publishers' => { reader: IgdbReader.new('Company'), rel: {} },
      'genres' => { reader: IgdbReader.new('Genre'), rel: {} },
      'platforms' => { reader: IgdbReader.new('Platform'), rel: {} }
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
      # make_game_relations(reader_str, keys, data)
    end
  end

  # Get data from inner reader
  def get_reader_data(table)
    @readers['developers'][:reader].get_cache_data
  end

  # Get data from inner reader
  def get_readers
    @readers.map { |_, e| e[:reader] }
  end

  def create_api_status
    @api_status = ApiStatus.create do |u|
      u.status = 'In Process'
      u.games = 0
      u.companies = 0
      u.genres = 0
      u.platforms = 0
      u.game_api_id = @connection.api.id
    end
    last_api_processing
  end

  def update_api_status(status)
    @api_status.status = status
    @api_status.games = @count
    @api_status.genres = @readers['genres'][:reader].count
    @api_status.platforms = @readers['platforms'][:reader].count
    @api_status.companies = @readers['developers'][:reader].count + @readers['publishers'][:reader].count
    @api_status.save
  end

  def success_api
    update_api_status 'Success'
  end

  def last_api_processing
    last_api_status = ApiStatus.where(game_api_id: @connection.api.id).where(status: 'Success').last
    if last_api_status
      add_filter 'created_at', 'gt', (last_api_status.created_at).strftime('%Q')
    end
  end
end
