class Prescription < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :name, :notes

  #Associations
  belongs_to :patients
  has_many :prescription_diseases
  has_many :diseases, :through => :prescription_diseases
end
