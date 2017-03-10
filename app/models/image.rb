class Image < ApplicationRecord

  paginates_per 5

  belongs_to :category

  validates :picture, presence: true
  validates :title, presence: true, length: { maximum: 50 }, uniqueness: true

  mount_uploader :picture, PictureUploader

  def self.create_pictures(pictures, category)
    pictures.each do |pict|
      category.images.create(title: pict.original_filename, picture: pict)
    end
  end
end