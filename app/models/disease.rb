class Disease < ActiveRecord::Base
  belong_to :patient
  attr_accessible :description, :name

  validates :description, :name, :presence => true
end
