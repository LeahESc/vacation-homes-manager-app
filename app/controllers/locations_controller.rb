class LocationsController < ApplicationController
    before_action :redirect

    def index  
        @locations = current_user.locations.uniq
    end 

    def show  
        @location = current_user.locations.find_by(id: params[:id])
        if !@location 
            flash[:error]  = "I'm sorry, you don't have access to view that page."
            redirect_to properties_path
        else 
            @properties = Property.local(params[:id])
            render :show 
        end 
    end 
   
end
