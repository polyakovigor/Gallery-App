class Category < ApplicationRecord
  has_many :images
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true, length: { maximum: 10 }, uniqueness: true

  accepts_nested_attributes_for :images, update_only: true, allow_destroy: true
end
