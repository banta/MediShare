class PrescriptionLine < ActiveRecord::Base
  attr_accessible :frequency, :period, :period_no, :quantity, :time
end
