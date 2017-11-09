class IgdbKey < ApplicationRecord
  validates :key, :owner_email, :key_class, :is_active, presence: true

  before_validation(on: :create) do
    self.is_active = true
  end

end
