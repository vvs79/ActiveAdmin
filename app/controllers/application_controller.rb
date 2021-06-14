class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  before_action :configure_devise_params, if: :devise_controller?

  private

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :user_name])
  end
end
