class Patient < ActiveRecord::Base
  attr_accessible :address, :civil_status, :country, :date_of_birth, :gender, :identification_number, :location, :names, :occupation, :phone, :town
end
