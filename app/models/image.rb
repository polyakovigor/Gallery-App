class Image < ApplicationRecord

  paginates_per 8

  mount_uploader :picture, PictureUploader

  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :picture, :category, presence: true

end