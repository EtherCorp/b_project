class Genre < ApplicationRecord
  has_and_belongs_to_many :games


  def self.create_with_params(params)
    a = Genre.new
    a.name = params[:name]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Genre.find_by(id: params[:id])
    a.name = params[:name]
    a.save
    a
	end

end
