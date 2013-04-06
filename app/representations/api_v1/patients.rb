module ApiV1::Patient
  extend ActiveSupport::Concern

  included do
    api_accessible :v1_patients_private do |template|
      template.add :id
      template.add :names
      template.add :identification_number
      template.add :gender
      template.add :address
      template.add :town
      template.add :location
      template.add :phone
      template.add :country
      template.add :occupation
      template.add :civil_status
      template.add :date_of_birth
      template.add :health_facility_id
    end
  end
end