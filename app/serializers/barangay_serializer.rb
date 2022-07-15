class BarangaySerializer < ActiveModel::Serializer
  attributes :code, :name, :city_municipality_id
  belongs_to :city_municipality, serializer: CityMunicipalitySerializer
end
