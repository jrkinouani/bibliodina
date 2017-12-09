class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(User)
        portal_path
      elsif resource_or_scope.is_a?(AdminUser)
        admin_dashboard_path(resource_or_scope)
      end
    end
    
  protected
  def  configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :description, :avatar, :email, :password, :password_confirmation])
  end
end
