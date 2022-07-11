class CityMunicipality < ApplicationRecord
  validates_presence_of :code
  validates_presence_of :name
  validates_presence_of :is_capital
  validates_presence_of :is_city
  validates_presence_of :is_municipality

  t.belongs_to :district
  t.belongs_to :province

end
