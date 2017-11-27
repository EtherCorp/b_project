class Country < ApplicationRecord
  has_and_belongs_to_many :currencies
  has_and_belongs_to_many :stores
  has_many :users
  belongs_to :normative


  def self.create_with_params(params)
    a = Country.new
    a.name = params[:name]
    a.normative_id = params[:normative_id]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Company.find_by(id: params[:id])
    a.name = params[:name]
    a.normative_id = params[:normative_id]
    a.save
    a
	end


end
