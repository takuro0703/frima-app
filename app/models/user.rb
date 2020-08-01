class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  has_one :address
  has_one :confirmation
  has_many :items


  has_many :items
  has_many :likes
  has_many :like_items, through: :likes, source: :item
end
