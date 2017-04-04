class User < ApplicationRecord
  has_many :categories
  has_many :images, through: :categories
  has_many :likes, through: :images
  has_many :comments

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable
end