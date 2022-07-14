class CityMunicipality < ApplicationRecord
  validates_presence_of :code
  validates_presence_of :name

  belongs_to :district, optional: true
  belongs_to :province, optional: true

  has_many :barangays
end
