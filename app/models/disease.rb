class Disease < ActiveRecord::Base
  belongs_to :patient
  attr_accessible :description, :name

  validates :description, :name, :presence => true
end
