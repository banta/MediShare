class Dmresult < ActiveRecord::Base
  
  #Accessible attributes
  attr_accessible :confidence, :rule, :support, :total

  #Associations
  belongs_to :data_mining
end
