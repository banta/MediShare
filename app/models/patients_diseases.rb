class PatientsDiseases < ActiveRecord::Base
  
  # Associations
  belongs_to :patient
  belongs_to :disease

  # Accessible attributes

  # Validations
  validates :patient_id, :disease_id, :presence => true
end
