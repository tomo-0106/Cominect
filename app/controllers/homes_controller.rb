class HomesController < ApplicationController
   def top
      @all_ranks = Comic.find(Review.group(:comic_id).order('count(comic_id) desc').limit(5).pluck(:comic_id))
      @all_rank = Comic.find(Favorite.group(:comic_id).order('count(comic_id) desc').limit(5).pluck(:comic_id))
   end

   def about
   end

   def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
   end

end
