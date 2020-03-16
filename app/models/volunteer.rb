class Volunteer < ApplicationRecord
  belongs_to :user
  has_many :roles
  has_many :skills
end
