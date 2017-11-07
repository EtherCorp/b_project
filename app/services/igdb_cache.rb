class IgdbCache
  attr_reader :cache_data

  def initialize(model_class)
    @cache_data = {}
    @model_class = model_class
    @table = model_class.name
  end

  # Return true if exists table with param id
  def not_in(keys)
    keys.reject { |k| @cache_data.key? k }
  end

  # Return data
  def get_h(key)
    @cache_data[key]
  end

  def store_data(to_store)
    to_store.each do |elem|
      @cache_data[elem['id']] = elem
    end
  end

  # Store all cache data to Active Records
  # called on demand
  def store_to_db
    # to do
  end
end
