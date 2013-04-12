class Disease < ActiveRecord::Base
  
  # Associations
  has_many :patients_diseases
  has_many :patients, :through => :patients_diseases

  # Accessible attributes
  attr_accessible :description, :name

  validates :description, :name, :presence => true
end
