class Prescription < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :name, :notes, :patient_id

  #Associations
  belongs_to :patient
  has_many :prescription_diseases
  has_many :diseases, :through => :prescription_diseases
end
