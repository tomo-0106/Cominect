class Comic < ApplicationRecord

   belongs_to :user
   attachment :image
   has_many :reviews, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :favorited_users,  through: :favorites, source: :user 
   belongs_to :genre


   validates :image, presence: true
   validates :author, presence: true
   validates :publisher, presence: true
   validates :title, presence: true
    validates :genre_id, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(method,word)
    if method == "forward_match"
            @comics = Comic.where("title LIKE ?","#{word}%")
    elsif method == "backward_match"
            @comics = Comic.where("title LIKE ?","%#{word}")
    elsif method == "perfect_match"
            @comics = Comic.where(title: "#{word}")
    elsif method == "partial_match"
            @comics = Comic.where("title LIKE ?","%#{word}%")
    else
            @comics = Comic.all
    end
  end

  def reviewd?(user)
    cnt = self.reviews.where(user_id: user.id).count
    return (cnt > 0)
  end

  def not_reviewd?(user)
    cnt = self.reviews.where(user_id: user.id).count
    return (cnt <= 0)
  end


end
