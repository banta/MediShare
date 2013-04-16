class Prescription < ActiveRecord::Base
  # attr_accessible :title, :body
  #Associations
  belongs_to :patients
  has_many :prescription_diseases
  has_many :diseases, :through => :prescription_diseases
end
