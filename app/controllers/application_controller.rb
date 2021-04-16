class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new,:create,:destroy]
   
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
