class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :span
  belongs_to_active_hash :fee
  belongs_to_active_hash :status
  has_many :images
  has_many :categories
  accepts_nested_attributes_for :images
end

