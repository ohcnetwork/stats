class Volunteer < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :skill
end
