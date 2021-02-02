class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user,only: [:edit,:show]

  def show
    @user = User.find(params[:id])
    @comics = @user.favorited_comics.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def correct_user
      @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to comics_path
    end
  end



  private
  def user_params
    params.require(:user).permit(:email, :name, :profile_image)
  end

end