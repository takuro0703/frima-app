class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :categories
  belongs_to :user
end
