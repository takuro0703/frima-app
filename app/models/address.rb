class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postal_code, :prefectures, :city, :house_number, presence: true
end
