class Api::Private::V1::PatientsController < Api::Private::V1::BaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def index
  	@patients = Patient.all
    respond_with(@patients, :api_template => :v1_patients_private, :status => :ok)
  end
end