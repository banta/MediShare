class PrescriptionLinesController < ApplicationController
  # GET /prescription_lines
  # GET /prescription_lines.json
  def index
    @prescription_lines = PrescriptionLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prescription_lines }
    end
  end

  # GET /prescription_lines/1
  # GET /prescription_lines/1.json
  def show
    @prescription_line = PrescriptionLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prescription_line }
    end
  end

  # GET /prescription_lines/new
  # GET /prescription_lines/new.json
  def new
    @prescription_line = PrescriptionLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prescription_line }
    end
  end

  # GET /prescription_lines/1/edit
  def edit
    @prescription_line = PrescriptionLine.find(params[:id])
  end

  # POST /prescription_lines
  # POST /prescription_lines.json
  def create
    @prescription_line = PrescriptionLine.new(params[:prescription_line])

    respond_to do |format|
      if @prescription_line.save
        format.html { redirect_to @prescription_line, notice: 'Prescription line was successfully created.' }
        format.json { render json: @prescription_line, status: :created, location: @prescription_line }
      else
        format.html { render action: "new" }
        format.json { render json: @prescription_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prescription_lines/1
  # PUT /prescription_lines/1.json
  def update
    @prescription_line = PrescriptionLine.find(params[:id])

    respond_to do |format|
      if @prescription_line.update_attributes(params[:prescription_line])
        format.html { redirect_to @prescription_line, notice: 'Prescription line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prescription_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescription_lines/1
  # DELETE /prescription_lines/1.json
  def destroy
    @prescription_line = PrescriptionLine.find(params[:id])
    @prescription_line.destroy

    respond_to do |format|
      format.html { redirect_to prescription_lines_url }
      format.json { head :no_content }
    end
  end
end
