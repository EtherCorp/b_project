class InvolvedCompany < ApplicationRecord
  belongs_to :game_asociation
  belongs_to :company
  belongs_to :company_role

end
