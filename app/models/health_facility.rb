class HealthFacility < ActiveRecord::Base
  acts_as_gmappable
  belongs_to :user
  has_many :patients
  
  attr_accessible :agency, :district, :division, :facility_type, :hmis, :latitude,
  :location, :longitude, :name, :province, :srm, :sub_location, :user_id, :address

  # Thinking sphinx
  define_index do
    # fields
    indexes address, district, division, facility_type, hmis, name, province, sub_location
    
    # attributes
    has id, created_at, updated_at
  end

  # Geocoder settings
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def gmaps4rails_address
  	location
  end

	def gmaps4rails_infowindow
  	"<b>#{name}</b>" << " - <b>#{location}</b>"<<"<p>
	Created @ #{created_at}</br>
	<a href='/health_facilities/#{id}'>More info</a></p>"
  end
end
