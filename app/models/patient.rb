class Patient < ActiveRecord::Base
  belongs_to :health_facility
  attr_accessible :address, :civil_status, :country, :date_of_birth, :gender,
  :identification_number, :location, :names, :occupation, :phone, :town, :health_facility_id

  define_index do
    # fields
    indexes address, civil_status, country, date_of_birth, gender,
    identification_number, location, names, occupation, phone, town, health_facility_id
    
    # attributes
    has id, created_at, updated_at
  end
end
