class RegionSerializer < ActiveModel::Serializer
  attributes :code, :name, :region_name, :count_of_provinces

  def code
    object.code
  end

  def name
    object.name
  end

  def region_name
    object.region_name
  end

  def count_of_provinces
    object.provinces.count
  end
end
