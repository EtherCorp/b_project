class Role < ApplicationRecord
  has_and_belongs_to_many :users

  def self.create_with_params(params)
    a = Role.new
    a.name = params[:name]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Role.find_by(id: params[:id])
    a.name = params[:name]
    a.save
    a
	end
end
