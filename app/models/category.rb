class Category < ApplicationRecord
  has_many :images
  belongs_to :user

  validates :name, :user_id, presence: true
end
