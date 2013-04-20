class HealthFacilitiesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /health_facilities
  # GET /health_facilities.json
  def index
    @health_facilities = HealthFacility.where(:source => nil)
    .paginate(:per_page => 10, :page => params[:page])

    @od_health_facilities = HealthFacility.where("source = ?", "opendata")
    .paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @health_facilities }
    end
  end

  # GET /health_facilities/1
  # GET /health_facilities/1.json
  def show
    @health_facility = HealthFacility.find(params[:id])
    @patients = @health_facility.patients

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @health_facility }
    end
  end

  # GET /health_facilities/new
  # GET /health_facilities/new.json
  def new
    @health_facility = HealthFacility.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @health_facility }
    end
  end

  # GET /health_facilities/1/edit
  def edit
    @health_facility = HealthFacility.find(params[:id])
  end

  # POST /health_facilities
  # POST /health_facilities.json
  def create
    @health_facility = HealthFacility.new(params[:health_facility])

    respond_to do |format|
      if @health_facility.save
        format.html { redirect_to @health_facility, notice: 'Health facility was successfully created.' }
        format.json { render json: @health_facility, status: :created, location: @health_facility }
      else
        format.html { render action: "new" }
        format.json { render json: @health_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /health_facilities/1
  # PUT /health_facilities/1.json
  def update
    @health_facility = HealthFacility.find(params[:id])

    respond_to do |format|
      if @health_facility.update_attributes(params[:health_facility])
        format.html { redirect_to @health_facility, notice: 'Health facility was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @health_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_facilities/1
  # DELETE /health_facilities/1.json
  def destroy
    @health_facility = HealthFacility.find(params[:id])
    @health_facility.destroy

    respond_to do |format|
      format.html { redirect_to health_facilities_url }
      format.json { head :no_content }
    end
  end

  def analytics
        if params[:search].present?
          ids = HealthFacility.search(params[:search]).collect{|c| c.id} # health_facility ids
          @json = HealthFacility.where(:id => ids).to_gmaps4rails

          #@json = HealthFacility.near(params[:search], 2, :order => :distance).to_gmaps4rails
        else
          @json = HealthFacility.all.to_gmaps4rails
        end
  end
end
