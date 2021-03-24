class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save!
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all.page(params[:page]).per(8)
  end

  def show
  end

  def destroy
  end

 private

  def post_image_params
    params.require(:post_image).permit(:image, :caption, :user_id, :sauna_facility_id)
  end


end
