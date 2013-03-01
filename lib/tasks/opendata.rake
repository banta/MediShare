require "open-uri"
require "net/http"

namespace :opendata do
    
  desc "Get all the health facilities"
  task :health_facilities => :environment do
      #if HealthFacility.count.zero?
          health_facilities_json = open("https://opendata.go.ke/api/views/e53f-gps5/rows.json?accessType=DOWNLOAD")
          data = JSON.parse(IO.read(health_facilities_json))["data"][0..8230]
      
          data.each do |hf|
              hf = hf[9..19]
              health_facility               = HealthFacility.new
              health_facility.name          = hf[0]     unless hf[0]     == 'nil'
              health_facility.hmis          = hf[1]     unless hf[1]     == 'nil'
              health_facility.province      = hf[2]     unless hf[2]     == 'nil'
              health_facility.district      = hf[3]     unless hf[3]     == 'nil'
              health_facility.division      = hf[4]     unless hf[4]     == 'nil'
              health_facility.location      = hf[5]     unless hf[5]     == 'nil'
              health_facility.sub_location  = hf[6]     unless hf[6]     == 'nil'
              health_facility.srm           = hf[7]     unless hf[7]     == 'nil'
              health_facility.facility_type = hf[8]     unless hf[8]     == 'nil'
              health_facility.agency        = hf[9]     unless hf[9]     == 'nil'
              health_facility.latitude      = hf[10][1] unless hf[10][1] == 'nil'
              health_facility.longitude     = hf[10][2] unless hf[10][2] == 'nil'
              if health_facility.save
                  puts health_facility.name + " created." unless health_facility.name.nil?
              end
        end
      #end
  end
end