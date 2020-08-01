class Image < ApplicationRecord
  belongs_to :item
<<<<<<< Updated upstream
  mount_uploader :image, ImagesUploader
=======
  mount_uploaders :image, ImgUploader
>>>>>>> Stashed changes
end
