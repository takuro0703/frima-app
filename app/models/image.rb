class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ImgUploader
end
