class BednetsAndIlliness < ActiveRecord::Base
  attr_accessible :county, :fever_or_malaria, :latitude, :longitude, :under_net
  
  geocoded_by :county
  after_validation :geocode, :if => :county_changed?
end
