class ApplicationController < ActionController::Base
    
   
    def welcome
      if user_signed_in? 
        redirect_to properties_path
      end
    end 

    private 

    def redirect 
      if !user_signed_in? 
        redirect_to '/'
      end 
    end 

end
