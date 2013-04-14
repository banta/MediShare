class Disease < ActiveRecord::Base
  
  # Associations
  has_many :patient_diseases
  has_many :patients, :through => :patient_diseases

  # Accessible attributes
  attr_accessible :description, :name

  validates :description, :name, :presence => true
end
