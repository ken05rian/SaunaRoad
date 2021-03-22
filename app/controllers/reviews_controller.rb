class ReviewsController < ApplicationController
  def index
    @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
    @reviews = Review.all
  end

  def new
    @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save!
    redirect_to sauna_facility_reviews_path(params[:sauna_facility_id])

  end

  private

 def review_params
  params.require(:review).permit(:title, :score, :caption)
 end
end
