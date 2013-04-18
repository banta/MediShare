class Prescription < ActiveRecord::Base
  # Accessible attributes
  attr_accessible :name, :notes, :patient_id, :diseases_tokens
  attr_reader :diseases_tokens

  #Associations
  belongs_to :patient
  has_many :prescription_diseases
  has_many :diseases, :through => :prescription_diseases

  # Validations
  validates :name, :patient_id, :presence => true

  def diseases_tokens=(ids)
    dis_tokens = ids.split(',').uniq
    self.patient_diseases.destroy_all

    dis_tokens.each do |id|
      self.patient_diseases.create!(:disease_id => id)
    end
  end
end
