class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  has_many :categories
  has_many :images, through: :categories
  has_many :likes
  has_many :comments
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

end