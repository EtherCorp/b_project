class KeyBalancer
  attr_reader :key

  # Class constructor
  def initialize
    set_keys
    @key = change_key
  end

  # Private function, set keys by default
  def set_keys
    @api_keys = %w[
      6c75d0f210d175c332c2e92e09ed3b2b
      2f53817fc459511a921fedcb288a040f
      995fdf72f4833198f2710188f5903dcd
      6bfb20184d99c32c7a5298f1b480a293
    ] # .shuffle!
  end

  # Add a key after initialize a key balancer
  def add_key(key)
    @api_keys += key
    # @api_keys.shuffle!
    change_key
  end

  def remove_key
    @api_keys.delete_at(@selected_key)
    # notify
  end

  # Only change key (on demand)
  def change_key
    return false if @api_keys.size.zero?
    @selected_key = Random.new.rand(0...@api_keys.size)
    @key = @api_keys[@selected_key]
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
