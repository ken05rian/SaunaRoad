class FoodsController < ApplicationController
  def index
    @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
    @reviews = @sauna_facility.reviews
    review_average = @sauna_facility.reviews.average('score')
    if !review_average.nil?
    @review_average = @sauna_facility.reviews.average('score').to_f.floor(2)
    @post_images = @sauna_facility.post_images.page(params[:page]).per(9)
    end
  end

end
