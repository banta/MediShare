class Disease < ActiveRecord::Base
  acts_as_api

  api_accessible :v1_diseases_private do |template|
    template.add :id
    template.add :name
    template.add :description
  end

  # Associations
  has_many :prescription_diseases
  has_many :prescriptions, :through => :prescription_diseases

  # Accessible attributes
  attr_accessible :description, :name

  validates :description, :name, :presence => true
end
