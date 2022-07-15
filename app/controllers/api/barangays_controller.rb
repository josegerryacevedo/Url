class Api::BarangaysController < ApplicationController
  def index
    barangays = Barangay.eager_load(:city_municipality).all
    render json: barangays, each_serializer: BarangaySerializer
  end
end
