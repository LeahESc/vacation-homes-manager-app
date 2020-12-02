class LocationsController < ApplicationController
    before_action :redirect

    def index  
            @locations = current_user.locations.uniq
    end 

    def show  
        @location = current_user.locations.find_by(id: params[:id])
        if @location 
            @properties = current_user.properties.where(location_id: params[:id])
            render :show 
        end 
    end 



end
