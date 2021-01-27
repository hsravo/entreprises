class ApplicationController < ActionController::Base

    before_action :configure_devise_parameters, if: :devise_controller?
    before_action :configure_permitted_parameters, if: :devise_controller?
    
      def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name, :acronym, :id_association, :asso_infos, :email, :password, :password_confirmation)}
      end
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:asso_infos, :email, :password, :password_confirmation, :current_password)}
      end
    
      add_flash_types :success, :danger

end
