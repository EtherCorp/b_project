class Normative < ApplicationRecord
  has_many :clasifications
  has_many :countries


  def self.create_with_params(params)
    a = Normative.new
    a.name = params[:name]
    a.code = params[:code]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Normative.find_by(id: params[:id])
    a.name = params[:name]
    a.code = params[:code]
    a.save
    a
	end

end
