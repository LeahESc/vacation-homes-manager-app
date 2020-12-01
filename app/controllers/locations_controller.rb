class LocationsController < ApplicationController
    
    def index 
        if user_signed_in? 
            @locations = current_user.locations
        else  
        redirect_to '/'
        end 
    end 

    def show 
        if user_signed_in? 
            @location = current_user.locations.find_by(id: params[:id])
            if @location 
                @properties = current_user.properties.where(location_id: params[:id])
                render :show 
            end 
        else  
        redirect_to '/' 
        end  
    end 



end
