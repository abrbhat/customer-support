class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  before_action :set_default_response_format_as_json

  protected

	def set_default_response_format_as_json
	  request.format = :json
	end
end
