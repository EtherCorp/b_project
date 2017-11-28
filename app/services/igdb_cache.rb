require 'json'

class IgdbCache
  def initialize(model_class)
    @cache_data = { in_db: {}, in_memory: {} }
    @model_class = model_class
    @table = model_class if model_class.class == String
  end

  # Return true if exists table with param id
  def not_in(keys)
    keys.reject do |k|
      internal_not_in(k)
    end
  end

  def internal_not_in(ext_id)
    return true if @cache_data[:in_db].key?(ext_id) || @cache_data[:in_memory].key?(ext_id)
    try_to_get_from_db(ext_id)
  end

  def try_to_get_from_db(ext_id)
    data = @model_class.where(external_id: ext_id).first
    return false if data.nil? || !data
    # store data in db part of cache
    @cache_data[:in_db][ext_id] = data.attributes
    true
  end

  # Store data to memory db
  def store_data(to_store)
    to_store.each do |elem|
      extra_data = {
        'external_id' => elem['id'],
        'created_at' => DateTime.now,
        'updated_at' => DateTime.now
      }
      elem = elem.merge(extra_data).except('id')
      @cache_data[:in_memory][elem['external_id']] = elem
    end
  end

  # Data to be stored
  def in_memory
    @cache_data[:in_memory]
  end

  # Returns all cached data
  def cache_data
    @cache_data
  end

  def in_db
    @cache_data[:in_db]
  end

  def count
    @cache_data[:in_memory].count + @cache_data[:in_db].count
  end
end
