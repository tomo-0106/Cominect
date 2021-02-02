class FavoritesController < ApplicationController

  def create
    comic = Comic.find(params[:comic_id])
    favorite = current_user.favorites.new(comic_id: comic.id)
    favorite.save
    redirect_back(fallback_location: comic_favorites_path(comic))
  end

  def destroy
    comic = Comic.find(params[:comic_id])
    favorite = current_user.favorites.find_by(comic_id: comic.id)
    favorite.destroy
    redirect_back(fallback_location: comic_favorites_path(comic))
  end

end
