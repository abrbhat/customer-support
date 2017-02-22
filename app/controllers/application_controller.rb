class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::ImplicitRender
  include ActionController::MimeResponds

  before_action :authenticate_user!, unless: :devise_controller?

  protected
end
