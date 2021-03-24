class SaunaFacilitiesController < ApplicationController
  before_action :admin?, only:[ :new, :create, :edit, :update, :destroy]

  def new
    @sauna_facility = SaunaFacility.new
  end

  def index
    @sauna_facilities = SaunaFacility.all.page(params[:page]).per(5)
  end

  def show
    @sauna_facility = SaunaFacility.find(params[:id])
    @reviews = SaunaFacility.find(params[:id]).reviews.limit(1).order('Reviews.created_at DESC')
    review_average = SaunaFacility.find(params[:id]).reviews.average('score')
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

  def create
    @sauna_facility = SaunaFacility.new(sauna_facility_params)
    @sauna_facility.save!
    redirect_to sauna_facilities_path
  end

  def edit
    @sauna_facility = SaunaFacility.find(params[:id])
  end

  def update
    @sauna_facility = SaunaFacility.find(params[:id])
    @sauna_facility.update(sauna_facility_params)
    @sauna_facility.save!
    redirect_to sauna_facilities_path
  end

  def destroy
    @sauna_facility = SaunaFacility.find(params[:id])
     @sauna_facility.destroy
    redirect_to sauna_facilities_path
  end

  def map
    @sauna_facility = SaunaFacility.find(params[:id])
  end

  private

 def admin?
   if !current_user.admin
     redirect_to root_path
   end
 end

 def sauna_facility_params
    params.require(:sauna_facility).permit(:image, :name, :address, :introduction, :telephone_number, :regular_holiday, :access, :business_hour, :latitude, :longitude)
 end

end
