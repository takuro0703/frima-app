class Confirmation < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, :last_name, :frigana_first_name, :frigana_last_name, :year, :month,:day, presence: true
end
