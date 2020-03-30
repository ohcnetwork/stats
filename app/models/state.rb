class State < ApplicationRecord
  has_many :reports
  has_many :state_reports
end
