class Category < ApplicationRecord

  has_many :images, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true, length: { maximum: 10 }, uniqueness: true

end
