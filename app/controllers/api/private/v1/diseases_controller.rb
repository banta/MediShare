class Api::Private::V1::DiseasesController < Api::Private::V1::BaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def index
  	@diseases = Disease.where("name like ?", "%#{params[:q]}%")

    respond_to do |format|
      format.json { render json: @diseases.map(&:attributes) }
    end
  end
end