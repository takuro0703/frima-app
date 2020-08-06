class Item < ApplicationRecord

  has_many :images
  has_many :items
 
  # scope :where, -> {where('item_name LIKE(?)'), "%#{search}%"}
  scope :looking,  -> (search) { where('item_name LIKE ?',  "%#{search}%") }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :span
  belongs_to_active_hash :fee
  belongs_to_active_hash :status
  has_many :images, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :images

 
  belongs_to :user


  

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  has_many :comments

  def self.search(search)
    if search
      Item.looking(search)
    else
      Item.all
    end
  end
end

