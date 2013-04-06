class Api::Private::V1::BaseController < ActionController::Base
  self.responder = ActsAsApi::Responder
  before_filter :authenticate_user!
  respond_to :json, :xml

  

  protected

  def record_not_found
    respond_with({:message => Medishare::Api::API_ERROR_CODES_MAP['10400'], :error_code => 10400, :status => 404},  :status => :not_found)
  end
end
