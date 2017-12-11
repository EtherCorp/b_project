require 'mongo'
# lib of MongoDB conections
class ActivityLogger
  @@connection = nil
  def initialize
    # set logger level to FATAL (only show serious errors)
    Mongo::Logger.logger.level = ::Logger::FATAL
    # set up a connection to the mongod instance which is running locally,
    # on the default port 27017
    if @@connection.nil?
      @@connection = Mongo::Client.new(['127.0.0.1:27017'], database: 'persistence_banana')
    end
  end

  def connection
    @@connection
  end

  # get connection to one collection
  def sniper
    @@connection['sniper']
  end

  def weplay
    @@connection['weplay']
  end

  def zmart
    @@connection['zmart']
  end

  def save_scrap_Sniper(params)
    if sniper.find(params).count() == 0
      sniper.insert_one(params)
    end
    params
  end

  def save_scrap_Weplay(params)
    if weplay.find(params).count() == 0 
      weplay.insert_one(params)
    end
  end

  def save_scrap_Zmart(params)
    if zmart.find(params).count() == 0
      zmart.insert_one(params)
    end
  end

  def close
    @@connection.close
  end
end
