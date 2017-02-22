class Category < ApplicationRecord
  has_many :images
  belongs_to :user

  validates :name, presence: true
end
