class UsersController < ApplicationController
  before_action :login?, only: [:following, :followers]

  def index
    @user = current_user
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @follows = Relationship.where(follow_id: @user.id)
    @follow_users = User.find(@follows.pluck(:user_id))
    @followers = Relationship.where(user_id: @user.id)
    @follower_users = User.find(@followers.pluck(:follow_id))
    @post_images = @user.post_images.order(created_at: "DESC")
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
      flash[:success] = "プロフィールを更新しました"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @follows = Relationship.where(follow_id: @user.id)
    @follow_users = User.find(@follows.pluck(:user_id))
    @users = User.all.page(params[:page]).per(10)
  end

  def followers
    @user = User.find(params[:id])
    @followers = Relationship.where(user_id: @user.id)
    @follower_users = User.find(@followers.pluck(:follow_id))
    @users = User.all.page(params[:page]).per(10)
  end

  private

  def user_params
   params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def login?
    unless user_signed_in?
      redirect_to root_path, notice: "アカウント登録もしくはログインしてください"
    end
  end
end

