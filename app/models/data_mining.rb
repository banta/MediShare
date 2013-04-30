class DataMining < ActiveRecord::Base
  # attr_accessible :title, :body

  #Associations
  has_many :dmresults
end
