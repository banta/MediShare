class Api::Private::V1::PatientsController < Api::Private::V1::BaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def index
  	@patients = Patient.all
    respond_with(@patients, :api_template => :v1_patients_private, :status => :ok)
  end

  def create
    @patient = Patient.new(params[:patient])
    @patient.names = params[:names]
    @patient.identification_number = params[:identification_number]
    @patient.gender = params[:gender]
    @patient.address = params[:address]
    @patient.town = params[:town]
    @patient.location = params[:location]
    @patient.phone = params[:phone]
    @patient.country = params[:country]
    @patient.occupation = params[:occupation]
    @patient.civil_status = params[:civil_status]
    @patient.date_of_birth = params[:date_of_birth]
    @patient.health_facility_id = params[:health_facility_id]

    if @patient.save
      respond_with(@patient, :api_template => :v1_patients_private, :status => :ok)
    else
      respond_with(@patient.errors, :status => :unprocessable_entity)
    end
  end

  def show
    @applicant = Patient.find(params[:id])
    respond_with(@applicant, :api_template => :v1_patients_private, :status => :ok)
  end
end