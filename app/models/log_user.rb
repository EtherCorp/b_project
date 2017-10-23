class LogUser < ApplicationRecord
  belongs_to :user
  belongs_to :action
end 