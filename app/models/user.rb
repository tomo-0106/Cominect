class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :comics, dependent: :destroy
   has_many :reviews, dependent: :destroy
   attachment :profile_image
   has_many :favorites, dependent: :destroy
   has_many :favorited_comics, through: :favorites, source: :comic


end
