class ApplicationController < ActionController::Base

  include Pagy::Backend
    
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name] )
    end

    helper_method :admin?
    def admin?
      current_user && current_user.role == "admin"
    end

    helper_method :customer?
    def customer?
        current_user && current_user.role == "customer"
    end


end
