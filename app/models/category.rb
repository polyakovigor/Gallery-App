class Category < ApplicationRecord
  has_many :images
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
end
