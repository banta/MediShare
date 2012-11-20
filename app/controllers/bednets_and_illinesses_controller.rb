class BednetsAndIllinessesController < ApplicationController
  # GET /bednets_and_illinesses
  # GET /bednets_and_illinesses.json
  def index
    @bednets_and_illinesses = BednetsAndIlliness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json do
            data = []
            @bednets_and_illinesses.each do |bednets_and_illiness|
              data << [
                "#{view_context.link_to(bednets_and_illiness.county, bednets_and_illiness)}".html_safe,
                  bednets_and_illiness.fever_or_malaria,
                  bednets_and_illiness.under_net
              ]
            end
            data = data.to_json
            data = "{ \"aaData\": " + data + "}"
            render :json => data, :layout => false
          end
    end
  end

  # GET /bednets_and_illinesses/1
  # GET /bednets_and_illinesses/1.json
  def show
    @bednets_and_illiness = BednetsAndIlliness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bednets_and_illiness }
    end
  end

  # GET /bednets_and_illinesses/new
  # GET /bednets_and_illinesses/new.json
  def new
    @bednets_and_illiness = BednetsAndIlliness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bednets_and_illiness }
    end
  end

  # GET /bednets_and_illinesses/1/edit
  def edit
    @bednets_and_illiness = BednetsAndIlliness.find(params[:id])
  end

  # POST /bednets_and_illinesses
  # POST /bednets_and_illinesses.json
  def create
    @bednets_and_illiness = BednetsAndIlliness.new(params[:bednets_and_illiness])

    respond_to do |format|
      if @bednets_and_illiness.save
        format.html { redirect_to @bednets_and_illiness, notice: 'Bednets and illiness was successfully created.' }
        format.json { render json: @bednets_and_illiness, status: :created, location: @bednets_and_illiness }
      else
        format.html { render action: "new" }
        format.json { render json: @bednets_and_illiness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bednets_and_illinesses/1
  # PUT /bednets_and_illinesses/1.json
  def update
    @bednets_and_illiness = BednetsAndIlliness.find(params[:id])

    respond_to do |format|
      if @bednets_and_illiness.update_attributes(params[:bednets_and_illiness])
        format.html { redirect_to @bednets_and_illiness, notice: 'Bednets and illiness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bednets_and_illiness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bednets_and_illinesses/1
  # DELETE /bednets_and_illinesses/1.json
  def destroy
    @bednets_and_illiness = BednetsAndIlliness.find(params[:id])
    @bednets_and_illiness.destroy

    respond_to do |format|
      format.html { redirect_to bednets_and_illinesses_url }
      format.json { head :no_content }
    end
  end
end
