class PhLocationService
  attr_reader :url

  def initialize
    @url = 'https://psgc.gitlab.io/api'
  end

  def get_regions
    response = RestClient.get("#{url}/regions")
    regions = JSON.parse(response.body)
    regions.each do |region|
      Region.find_or_create_by(code: region['code'], name: region['name'], region_name: region['regionName'])
    end
  end

  def get_provinces
    response = RestClient.get("#{url}/provinces")
    provinces = JSON.parse(response.body)
    provinces.each do |province|
      region = Region.find_by_code(province['regionCode'])
      Province.find_or_create_by(code: province['code'], name: province['name'], region: region)
    end
  end

  def get_districts
    response = RestClient.get("#{url}/districts")
    districts = JSON.parse(response.body)
    districts.each do |district|
      region = Region.find_by_code(district['regionCode'])
      District.find_or_create_by(code: district['code'], name: district['name'], region: region)
    end
  end

  def get_city_municipalities
    response = RestClient.get("#{url}/cities-municipalities")
    city_municipalities = JSON.parse(response.body)
    city_municipalities .each do |city_municipality|
      if city_municipality['provinceCode']
        province = Province.find_by_code(city_municipality['provinceCode'])
        CityMunicipality.find_or_create_by(code: city_municipality['code'], name: city_municipality['name'], is_capital:city_municipality['isCapital'], is_city:city_municipality['isCity'], is_municipality: city_municipality['isMunicipality'], province: province)
      else
        district = District.find_by_code(city_municipality['districtCode'])
        CityMunicipality.find_or_create_by(code: city_municipality['code'], name: city_municipality['name'], is_capital:city_municipality['isCapital'], is_city:city_municipality['isCity'], is_municipality: city_municipality['isMunicipality'], district: district)
      end
    end
  end

end