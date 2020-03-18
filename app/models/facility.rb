class Facility < ApplicationRecord
  belongs_to :district
  has_one :facility_type
end
