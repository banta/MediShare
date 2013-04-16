class Prescriptions < ActiveRecord::Base
  # attr_accessible :title, :body
  #Associations
  belongs_to :patients
end
