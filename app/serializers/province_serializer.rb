class ProvinceSerializer < ActiveModel::Serializer
  attributes :code, :name, :region_id
  belongs_to :region, serializer: RegionSerializer
  has_many :city_municipalities


end
