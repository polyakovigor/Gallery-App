class Image < ApplicationRecord
  belongs_to :category

  validates :title, :picture, presence: true

  mount_uploader :picture, PictureUploader

  def self.create_pictures(pictures, category)
    pictures.each do |pict|
      category.images.create(title: pict.original_filename, picture: pict)
    end
  end
end