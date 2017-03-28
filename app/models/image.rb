class Image < ApplicationRecord

  paginates_per 5

  belongs_to :category

  validates :title, presence: true, length: { maximum: 20 }
  validates :picture, presence: true

  mount_uploader :picture, PictureUploader
end