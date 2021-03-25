class FoodsController < ApplicationController
  def index
    @sauna_facility = SaunaFacility.find(params[:sauna_facility_id])
  end
end
