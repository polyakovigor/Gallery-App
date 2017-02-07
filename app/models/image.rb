class Image < ApplicationRecord
  belongs_to :category

  mount_uploader :picture, PictureUploader
end
