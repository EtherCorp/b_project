class KeyBalancer
  # Class constructor
  def initialize
    set_keys
    select_key
  end

  # Returns the string that contains the key
  def key
    @using_key.update(last_used: DateTime.now)
    @using_key.key
  end

  # Private function, set keys by default
  def set_keys
    limit = 100
    @api_keys = IgdbKey.where(is_active: true).limit(limit).to_a
  end

  # Add a key after initialize a key balancer (for admin module)
  def add_key(key, owner_email, key_class)
    created_key = IgdbKey.create(
      key: key,
      owner_email: owner_email,
      key_class: key_class
    )
    @api_keys.push(created_key)
    select_key
  end

  # We assume that the key is removed because is not active
  def remove_key
    return false if api_keys?
    @using_key.update(is_active: false)
    puts "Key id: #{@api_keys[@selected_key].id} is inactive"
    @api_keys.delete_at(@selected_key)
  end

  # Only change key (on demand)
  def select_key
    return false unless api_keys?
    @selected_key = Random.new.rand(0...@api_keys.count)
    @using_key = @api_keys[@selected_key]
  end

  # Change and remove key. Useful if a key is invalid
  def remove_and_select_key
    remove_key
    select_key
  end

  def api_keys?
    !@api_keys.empty?
  end

  private :set_keys
end
