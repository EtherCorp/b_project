class Company < ApplicationRecord
  has_many :involved_companies

  def self.create_with_params(params)
    a = Company.new
    a.name = params[:name]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Company.find_by(id: params[:id])
    a.name = params[:name]
    a.save
    a
	end


end
