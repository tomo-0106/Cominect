class ComicsController < ApplicationController
  before_action :authenticate_user!
  

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
    @comics = Comic.page(params[:page]).reverse_order
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
    if @comic.save
        redirect_to  comics_path
    else
        render :new
    end
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

  def search
    method = params[:search_method]
    word = params[:search_word]
    @comics = Comic.search(method,word).page(params[:page]).reverse_order
    render :index
  end

  def correct_comic
        @comic = Comic.find_by(params[:id])
    unless @comic.user.id == current_user.id
      render  new_comic_path
    end
  end


  private
  def comic_params
    params.require(:comic).permit(:genre_id, :image, :title, :body, :author, :publisher, :is_active, :genre)
  end





end
