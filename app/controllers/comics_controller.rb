class ComicsController < ApplicationController

  def new
    @comic = Comic.new
  end

  def show
    @comic = Comic.find(params[:id])
    @review = Review.new
  end

  def index
    @comics = Comic.all
    @users = User.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @genres = Genre.all
    else
      @genres = Genre.all
    end
  end

  def create
  @comic = Comic.new(comic_params)
  @comic.user_id = current_user.id
  @comic.save
  redirect_to comics_path
  end

  def edit

  end

  def update

  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to comics_path
  end

  private
  def comic_params
    params.require(:comic).permit(:genre_id, :image, :title, :body, :author, :publisher, :is_active, :genre)
  end





end
