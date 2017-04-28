class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  has_many :categories
  has_many :images, through: :categories
  has_many :likes
  has_many :comments
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  def full_name
    "#{ first_name } #{ second_name }"
  end

  def likes?(image)
    image.likes.where(user_id: id).any?
  end
end