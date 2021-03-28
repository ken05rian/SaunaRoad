class PostImagesController < ApplicationController

  before_action :authenticate_user!,except: [:index, :show]

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      flash[:success] = "写真を投稿しました"
      redirect_to post_images_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end

  end

  def index
    @post_images = PostImage.all.order(created_at: "DESC").page(params[:page]).per(8)
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    if @post_image.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to post_image_path(@post_image)
    end
  end

 private

  def post_image_params
    params.require(:post_image).permit(:image, :caption, :user_id, :sauna_facility_id)
  end


end
