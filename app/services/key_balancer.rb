class KeyBalancer
  # Returns the string that contains the key
  def key
    @key
    @api_keys[@selected_key].update(last_used: DateTime.now)
  end
  
  # Class constructor
  def initialize
    set_keys
    @key = change_key
  end

# Private function, set keys by default
  def set_keys
    limit = 100
    @api_keys = IgdbKey.where(:is_active=>true).limit(limit).to_a
  end

  # Add a key after initialize a key balancer (for admin module)
  def add_key(key, owner_email, key_class)
    created_key = IgdbKey.create(key: key, owner_email: owner_email, key_class: key_class)
    @api_keys.push(created_key)
    # @api_keys.shuffle!
    change_key
  end
  
  #We assume that the key is removed because is not active
  def remove_key
    return false if @api_keys.api_keys?
    @api_keys[@selected_key].update(is_active: false)
    puts "Key #{@api_keys[@selected_key][:id]} was removed"
    @api_keys.delete_at(@selected_key)
  end

  # Only change key (on demand)
  def change_key
    return false if @api_keys.api_keys?
    @selected_key = Random.new.rand(0...@api_keys.count)
    @key = @api_keys[@selected_key][:key]
  end

  # Change and remove key. Useful if a key is invalid
  def remove_and_change_key
    remove_key
    change_key
  end

  def api_keys?
    !@api_keys.empty?
  end

  private :set_keys
end

# Obtener el count directamente de la variable api_keys y no de la base de datos
