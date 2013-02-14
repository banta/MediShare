class HealthFacility < ActiveRecord::Base
  belongs_to :user
  attr_accessible :agency, :district, :division, :facility_type, :hmis, :latitude, :location, :longitude, :name, :province, :srm,
  :sub_location
end
