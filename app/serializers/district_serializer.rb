class DistrictSerializer < ActiveModel::Serializer
  attributes :code, :name, :region_id
  belongs_to :region, serializer: RegionSerializer

end
