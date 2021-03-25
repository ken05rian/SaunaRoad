class ReviewsController < ApplicationController

  before_action :authenticate_user!,except: [:index]

  def index
    @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
    @reviews = Review.all
    review_average = @sauna_facility.reviews.average('score')
    if !review_average.nil?
    @review_average =  if review_average > review_average.floor + 0.6
                         review_average.floor + 1
                       elsif review_average < review_average.floor + 0.4
                         review_average.floor
                       elsif (review_average.floor + 0.4 >= review_average) || ( review_average <= review_average.floor + 0.6)
                         review_average.floor + 0.5
                       else
                         review_average
                       end
    end
  end

  def new
    @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
    @review = Review.new
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.sauna_facility_id = params[:sauna_facility_id]
    if @review.save
      redirect_to sauna_facility_reviews_path(params[:sauna_facility_id])
    else
      render :new
    end
  end

  private

 def review_params
  params.require(:review).permit(:title, :score, :caption)
 end
end
