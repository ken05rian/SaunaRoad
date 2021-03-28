class HomesController < ApplicationController

  def top
     @post_images = PostImage.where("created_at >= ?", Date.today).page(params[:page]).per(3)
  end
end
