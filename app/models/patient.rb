class Patient < ActiveRecord::Base
  acts_as_api

  api_accessible :v1_patients_private do |template|
    template.add :id
    template.add :names
    template.add :identification_number
    template.add :gender
    template.add :address
    template.add :town
    template.add :location
    template.add :phone
    template.add :country
    template.add :occupation
    template.add :civil_status
    template.add :date_of_birth
    template.add :health_facility_id
  end
  
  # Associations
  belongs_to :health_facility
  has_many :prescriptions
  
  attr_accessible :address, :civil_status, :country, :date_of_birth, :gender,
  :identification_number, :location, :names, :occupation, :phone, :town, :health_facility_id

  define_index do
    # fields
    indexes address, civil_status, country, date_of_birth, gender,
    identification_number, location, names, occupation, phone, town, health_facility_id
    
    # attributes
    has id, created_at, updated_at
  end

  validates :address, :civil_status, :country, :date_of_birth, :gender,
  :identification_number, :location, :names, :occupation, :phone, :town,
  :health_facility_id, :presence => true

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
