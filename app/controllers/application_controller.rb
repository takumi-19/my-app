class ApplicationController < ActionController::Base
  # before_action :authenticate_supporter!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :team_id])
  end
end
