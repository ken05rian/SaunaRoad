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
    @reviews = Review.all.page(params[:page]).per(1)
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
