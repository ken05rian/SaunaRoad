class SaunaFacilitiesController < ApplicationController
  # before_action :admin?, only:[ :new, :create, :edit, :update, :destroy]

  def new
    @sauna_facility = SaunaFacility.new
  end

  def index
    sauna_list = SaunaFacility.all
    sauna_facilities = sauna_list.search(params[:search])
    @sauna_facilities_total = sauna_facilities.count
    @sauna_facilities = sauna_facilities.page(params[:page]).per(5)
    if @sauna_facilities.size > 5
      @sauna_start_count = @sauna_facilities.page(params[:page]).size + 5 * (@sauna_facilities.page(params[:page]).current_page - 1)
    else
      @sauna_start_count = 1
    end
    @sauna_facilities.size > 5 ? @sauna_end_count = 5 : @sauna_end_count = @sauna_facilities.size
  end

  def show
    @sauna_facility = SaunaFacility.find(params[:id])
    @post_images = @sauna_facility.post_images.limit(3)
    @reviews = @sauna_facility.reviews
    review_average = @reviews.average('score')
    if !review_average.nil?
      @review_average = @sauna_facility.reviews.average('score').to_f.floor(2)
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
    @reviews = @sauna_facility.reviews
    review_average = @sauna_facility.reviews.average('score')
    if !review_average.nil?
    @review_average = @sauna_facility.reviews.average('score').to_f.floor(2)
    end
  end



  private

# def admin?
#   if !current_user.admin
#     redirect_to root_path
#   end
# end

 def sauna_facility_params
    params.require(:sauna_facility).permit(:image, :name, :address, :introduction, :telephone_number, :regular_holiday, :access, :business_hour, :latitude, :longitude)
 end

end
