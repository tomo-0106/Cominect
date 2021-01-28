class Review < ApplicationRecord
  belongs_to :user
  belongs_to :comic



  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

    validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
    }, presence: true
end
