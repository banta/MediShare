class Disease < ActiveRecord::Base
  acts_as_api

  api_accessible :v1_diseases_private do |template|
    template.add :id
    template.add :name
    template.add :description
  end

  # Associations
  has_many :patient_diseases
  has_many :patients, :through => :patient_diseases

  # Accessible attributes
  attr_accessible :description, :name

  validates :description, :name, :presence => true
end
