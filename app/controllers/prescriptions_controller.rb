class PrescriptionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # POST /prescriptions
  # POST /prescriptions.json
  def create
    @prescription = Prescription.new(params[:prescription])

    respond_to do |format|
      if @prescription.save
        format.html { redirect_to patient_path(@prescription.patient.id), notice: 'Prescription was successfully created.' }
        format.json { render json: @prescription, status: :created, location: @prescription }
      else
        format.html { redirect_to patient_path(@prescription.patient.id), alert: 'Name of the prescription is required.' }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prescriptions/1
  # PUT /prescriptions/1.json
  def update
    @prescription = Prescription.find(params[:id])

    respond_to do |format|
      if @prescription.update_attributes(params[:prescription])
        format.html { redirect_to patient_path(@prescription.patient.id), notice: 'Prescription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to patient_path(@prescription.patient.id), alert: 'Name of the prescription is required.' }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.json
  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy

    respond_to do |format|
      format.html { redirect_to patient_path(@prescription.patient.id), notice: 'Prescription was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
