class FoodsController < ApplicationController
  def index
    @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
    @reviews = @sauna_facility.reviews
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

end
