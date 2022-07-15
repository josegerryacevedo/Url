class Api::DistrictsController < ApplicationController
  def index
    districts = District.eager_load(:region).all
    render json: districts, each_serializer: DistrictSerializer
  end
end
