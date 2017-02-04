class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::ImplicitRender
  include CanCan::ControllerAdditions

  before_action :set_default_response_format_as_json

  protected

	def set_default_response_format_as_json
	  request.format = :json
	end
end
