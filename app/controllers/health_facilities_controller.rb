class HealthFacilitiesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /health_facilities
  # GET /health_facilities.json
  def index
    @health_facilities = HealthFacility.all

    respond_to do |format|
      format.html # index.html.erb
      format.json do
          data = []
          @health_facilities.each do |health_facility|
            data << [
              "#{view_context.link_to(health_facility.name, health_facility)}".html_safe,
                health_facility.province,
                health_facility.district,
                health_facility.division,
                health_facility.location,
                health_facility.sub_location,
                health_facility.srm,
                health_facility.agency
            ]
          end
          data = data.to_json
          data = "{ \"aaData\": " + data + "}"
          render :json => data, :layout => false
        end
    end
  end

  # GET /health_facilities/1
  # GET /health_facilities/1.json
  def show
    @health_facility = HealthFacility.find(params[:id])

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
end
