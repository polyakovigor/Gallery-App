class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image

  has_many :users, through: :likes
end
