class Api::CityMunicipalitiesController < ApplicationController
  def index
    city_municipalities = CityMunicipality.eager_load(:province, :district).all
    render json: city_municipalities, each_serializer: CityMunicipalitySerializer
  end
end
