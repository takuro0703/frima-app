class Item < ApplicationRecord
  has_many :images
  has_many :items
  belongs_to :user


  

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
