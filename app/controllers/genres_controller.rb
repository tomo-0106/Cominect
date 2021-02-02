class GenresController < ApplicationController
  
  def new
    @genre = Genre.new
    @genres = Genre.all
  end


  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_back(fallback_location: root_path)
    else
      @genres = Genre.all
      render :new
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to new_genre_path
  end
  

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
