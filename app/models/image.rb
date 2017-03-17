class Image < ApplicationRecord

  paginates_per 5

  belongs_to :category

  validates :picture, presence: true
  validates :title, presence: true

  mount_uploader :picture, PictureUploader
end