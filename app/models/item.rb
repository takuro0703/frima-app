class Item < ApplicationRecord
  has_many :images
  has_many :categories
  belongs_to :user
end
