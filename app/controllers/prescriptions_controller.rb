class PrescriptionsController < ApplicationController
  #before_filter :authenticate_user!
  #load_and_authorize_resource
  
  respond_to :html, :json

  before_filter :set_variables, :only => [:edit, :update, :destroy]

  def index
    @prescriptions = Post.find(params[:post_id]).prescriptions
    if request.xhr?
      render :partial => 'index', :locals => { :prescriptions => @prescriptions }
    else
      respond_with @prescriptions
    end
  end

  def new
    @prescription = Prescription.new
    respond_with @prescription
  end

  def create
    @prescription = Prescription.new(params[:prescription])
    if @prescription.save && request.xhr?
      render :partial => 'show', :locals => { :prescription => @prescription }
    else
      respond_with @prescription
    end
  end

  def show
    @prescription = Prescription.find(params[:id])
    if request.xhr?
      render :partial => 'show', :locals => { :prescription => @prescription }
    else
      respond_with @prescription
    end
  end

  def edit
    if request.xhr?
      render :partial => 'edit', :locals => { :prescription => @prescription }
    else
      respond_with @prescription
    end
  end

  def update
    if @prescription.update_attributes(params[:prescription]) && request.xhr?
      render :partial => 'show', :locals => { :prescription => @prescription }
    else
      respond_with @prescription
    end
  end

  def destroy
    @prescription.destroy
    respond_with @prescription
  end

  private
  def set_variables
    @prescription = Prescription.find(params[:id])
  end
end
