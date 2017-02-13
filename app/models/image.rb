class Image < ApplicationRecord
  belongs_to :category

  validates :title,  presence: true
  validates :category_id,  presence: true
  validates :picture,  presence: true

  mount_uploader :picture, PictureUploader
end
