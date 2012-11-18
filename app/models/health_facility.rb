class HealthFacility < ActiveRecord::Base
  attr_accessible :agency, :district, :division, :hmis, :latitude, :location, :longitude, :name, :province, :srm, :sub_location, :type
end
