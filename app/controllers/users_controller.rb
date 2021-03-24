class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def following
  end

  def followers
  end

  private

  def user_params
   params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
  
  