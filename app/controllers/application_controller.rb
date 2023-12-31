class ApplicationController < ActionController::Base
   #protect_from_forgery unless: -> { request.format.json? }
   protect_from_forgery with: :null_session
   skip_before_action :verify_authenticity_token
   before_action :configure_permitted_parameters, if: :devise_controller?
  

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:mobile,:role, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name,:mobile,:role, :email, :password, :current_password)}
  end
end
