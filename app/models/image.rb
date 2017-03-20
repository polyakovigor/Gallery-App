class Image < ApplicationRecord

  paginates_per 5

  belongs_to :category

  validates :title, :picture, presence: true

  mount_uploader :picture, PictureUploader
end