class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::ImplicitRender
  include ActionController::MimeResponds
  include CanCan::ControllerAdditions

  protected
end
