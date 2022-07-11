class District < ApplicationRecord
  validates_presence_of :code
  validates_presence_of :name

  belongs_to :region
  has_many :city_municipality
end
