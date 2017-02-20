class Image < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, :category_id, :picture, presence: true

  mount_uploader :picture, PictureUploader
end
