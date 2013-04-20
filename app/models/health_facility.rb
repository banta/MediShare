class HealthFacility < ActiveRecord::Base
  acts_as_gmappable
  belongs_to :user
  has_many :patients
  
  attr_accessible :agency, :district, :division, :facility_type, :hmis, :latitude,
  :location, :longitude, :name, :province, :srm, :sub_location, :user_id, :address

  # Geocoder settings
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def gmaps4rails_address
  	location
  end

	def gmaps4rails_infowindow
  	"<h4>#{name}</h4>" << "<h4>#{location}</h4>"<<"<p>
		Reported @ #{created_at}</br>
		<a href='/diseases/#{id}'>More info</a></p>"
  end
end
