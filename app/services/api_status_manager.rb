class ApiStatusManager
  def initialize(api_id)
    @api_id = api_id
  end

  # Make a new api status into database
  def new_status
    @api_status = ApiStatus.create do |u|
      u.status = 'In Process'
      u.games = 0
      u.companies = 0
      u.genres = 0
      u.platforms = 0
      u.game_api_id = @api_id
    end
  end

  # Generic api status update
  def update_api_status(status, counts)
    @api_status.status = status
    @api_status.games = counts['games']
    @api_status.genres = counts['genres']
    @api_status.platforms = counts['platforms']
    @api_status.companies = counts['developers'] + counts['publishers']
    @api_status.save
  end

  # Used if data was received and stored in cache
  def received_api(counts)
    update_api_status 'Storing to database', counts
  end

  # Used if data was stored in database
  def stored_api(counts)
    update_api_status 'Data stored', counts
  end

  # Used if there are any errors in the api reading proccess
  def error_api(counts)
    update_api_status 'Error', counts
  end

  # Returns last api status
  def last_api_processing
    ApiStatus.where(game_api_id: @api_id).where(status: 'Data stored').last
  end
end
