class DataMiningsController < ApplicationController
  # GET /data_minings
  # GET /data_minings.json
  def index
    @data_minings = DataMining.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_minings }
    end
  end

  # GET /data_minings/1
  # GET /data_minings/1.json
  def show
    @data_mining = DataMining.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_mining }
    end
  end

  # GET /data_minings/new
  # GET /data_minings/new.json
  def new
    @data_mining = DataMining.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_mining }
    end
  end

  # GET /data_minings/1/edit
  def edit
    @data_mining = DataMining.find(params[:id])
  end

  # POST /data_minings
  # POST /data_minings.json
  def create
    @data_mining = DataMining.new(params[:data_mining])

    respond_to do |format|
      if @data_mining.save
        format.html { redirect_to @data_mining, notice: 'Data mining was successfully created.' }
        format.json { render json: @data_mining, status: :created, location: @data_mining }
      else
        format.html { render action: "new" }
        format.json { render json: @data_mining.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data_minings/1
  # PUT /data_minings/1.json
  def update
    @data_mining = DataMining.find(params[:id])

    respond_to do |format|
      if @data_mining.update_attributes(params[:data_mining])
        format.html { redirect_to @data_mining, notice: 'Data mining was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_mining.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_minings/1
  # DELETE /data_minings/1.json
  def destroy
    @data_mining = DataMining.find(params[:id])
    @data_mining.destroy

    respond_to do |format|
      format.html { redirect_to data_minings_url }
      format.json { head :no_content }
    end
  end
end
