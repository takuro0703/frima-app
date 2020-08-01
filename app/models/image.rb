class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ImagesUploader
  validates :image, presence: true
end
