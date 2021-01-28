class Comic < ApplicationRecord

   belongs_to :user
   attachment :image
   has_many :reviews, dependent: :destroy
   has_many :favorites, dependent: :destroy
   belongs_to :genre

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end



end
