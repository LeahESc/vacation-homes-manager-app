class ApplicationController < ActionController::Base
    
   
    def welcome
      if user_signed_in? 
        redirect_to properties_path
      end
    end 

    # protected
  
    # def configure_permitted_parameters
    #   added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    # end

end
