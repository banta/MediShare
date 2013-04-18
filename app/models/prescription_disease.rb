class PrescriptionDisease < ActiveRecord::Base
  #Accessible attributes
  attr_accessible :disease_id, :prescription_id

  #Associations
  belongs_to :prescription
  belongs_to :disease

  #Validations
  validates :disease_id, :prescription_id, :presence => true
end
