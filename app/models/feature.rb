class Feature < ApplicationRecord
  has_and_belongs_to_many :products

  def self.create_with_params(params)
    a = Feature.new
    a.name = params[:name]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Feature.find_by(id: params[:id])
    a.name = params[:name]
    a.save
    a
	end

end
