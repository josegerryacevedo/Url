class CityMunicipalitySerializer < ActiveModel::Serializer
  attributes :code, :name, :is_capital, :is_city, :is_municipality, :district_id, :province_id
  belongs_to :province, serializer: ProvinceSerializer
  belongs_to :district, serializer: DistrictSerializer
  has_many :barangays
end
