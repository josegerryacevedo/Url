class Barangay < ApplicationRecord
  validates_presence_of :code
  validates_presence_of :name

  belongs_to :city_municipality
end

