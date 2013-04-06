class Patient < ActiveRecord::Base
  acts_as_api
  include ApiV1::Patient
  
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

  def self.import(file, user, s)
    CSV.foreach(file.path, headers: true) do |row|
      patient = find_by_id(row["id"]) || new
      patient.names = row["names"]
      patient.address = row["address"]
      patient.civil_status = row["civil_status"]
      patient.country = row["country"]
      patient.date_of_birth = row["date_of_birth"]
      patient.gender = row["gender"]
      patient.identification_number = row["identification_number"]
      patient.location = row["location"]
      patient.occupation = row["occupation"]
      patient.phone = row["phone"]
      patient.town = row["town"]
      if s == true
        patient.health_facility_id = user.health_facility.id
      end
      patient.save!
    end
  end
end
