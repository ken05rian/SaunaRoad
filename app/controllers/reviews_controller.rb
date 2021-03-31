class ReviewsController < ApplicationController

  before_action :authenticate_user!,except: [:index]

  def index
    @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
    @reviews = Review.where(sauna_facility_id: params[:sauna_facility_id] )
    review_average = @sauna_facility.reviews.average('score')
    if !review_average.nil?
    @review_average = @sauna_facility.reviews.average('score').to_f.floor(2)
    end
  end

  def new
    @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
    @reviews = @sauna_facility.reviews
    @review = Review.new
    review_average = @sauna_facility.reviews.average('score')
    if !review_average.nil?
     @review_average = @sauna_facility.reviews.average('score').to_f.floor(2)
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.sauna_facility_id = params[:sauna_facility_id]
    if @review.save
      flash[:success] = "口コミを投稿しました"
      redirect_to sauna_facility_reviews_path(params[:sauna_facility_id])
    else
      flash.now[:alert] = "投稿に失敗しました"
      @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
      @review_average = @sauna_facility.reviews.average('score').to_f.floor(2)
      render :new
    end
  end


  def destroy
    @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
    @reviews = Review.find(params[:id])
    if @reviews.destroy
      flash[:success] = "口コミを削除しました"
      redirect_to sauna_facility_reviews_path(@sauna_facility)
    end

  end

  private

 def review_params
  params.require(:review).permit(:title, :score, :caption)
 end
end
