class PatientDisease < ActiveRecord::Base
  

  # Associations
  belongs_to :patient
  belongs_to :disease

  # Accessible attributes
  attr_accessible :disease_id, :patient_id
  
  # Validations
  validates :patient_id, :disease_id, :presence => true
end
