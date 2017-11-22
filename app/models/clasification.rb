class Clasification < ApplicationRecord
  has_and_belongs_to_many :games
  belongs_to :normative


  def self.create_with_params(params)
    a = Clasification.new
    a.normative_id = params[:normative_id]
    a.code = params[:code]
    a.details = params[:details]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Clasification.find_by(id: params[:id])
    a.normative_id = params[:normative_id]
    a.code = params[:code]
    a.details = params[:details]
    a.save
    a
	end
end
