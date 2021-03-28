class HomesController < ApplicationController

  def top
     @post_images = PostImage.where("created_at >= ?", Date.today).order(created_at: "DESC").page(params[:page]).per(3)
     @sauna_facilities = SaunaFacility.find(Review.group(:sauna_facility_id).order("avg(score) desc").limit(3).pluck(:sauna_facility_id))
  end
end
