class Image < ApplicationRecord

  paginates_per 5
  mount_uploader :picture, PictureUploader

  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :picture, :category, presence: true
  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'should be less than 5MB')
    end
  end
end