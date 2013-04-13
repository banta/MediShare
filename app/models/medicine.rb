class Medicine < ActiveRecord::Base
  
  # Accessible fields
  attr_accessible :description, :name

  # Validations
  validates :description, :name, :presence => true
end
