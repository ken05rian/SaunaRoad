class SaunaFacilitiesController < ApplicationController
  before_action :admin?, only:[ :new, :create, :edit, :update, :destroy]

  def new
    @sauna_facility = SaunaFacility.new
  end

  def index
    @sauna_facilities = SaunaFacility.page(params[:page])
  end

  def show
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


  private

 def admin?
   if !current_user.admin
     redirect_to root_path
   end
 end

 def sauna_facility_params
    params.require(:sauna_facility).permit(:image, :name, :address, :introduction, :telephone_number, :regular_holiday, :access, :business_hour)
 end

end
