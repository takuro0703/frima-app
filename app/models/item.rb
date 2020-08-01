class Item < ApplicationRecord
  has_many :images
  has_many :items
  belongs_to :user


  

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  # def like_by?(user)
  #   likes.where(user_id: user.id).exists?

  # end
end
