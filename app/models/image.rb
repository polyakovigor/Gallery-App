class Image < ApplicationRecord

  paginates_per 5

  belongs_to :category

  validates :picture, presence: true
  validates :title, presence: true, length: { maximum: 50 }

  mount_uploader :picture, PictureUploader

  after_create :fill_in_title

  def fill_in_title
    self.title = self.picture.set_original_filename
    self.save
  end
end