class Image < ApplicationRecord

  paginates_per 5

  belongs_to :category
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 20 }
  validates :picture, presence: true

  mount_uploader :picture, PictureUploader
end