class Category < ApplicationRecord

  paginates_per 8

  has_many :images, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true, length: { maximum: 10 }, uniqueness: true

end
