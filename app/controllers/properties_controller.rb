class PropertiesController < ApplicationController

    def index 
        @properties = current_user.properties
    end 

    def new 
        @property = Property.new 
        @amenitites = Amenity.all 
    end 

    def create 
        binding.pry 
        @property = current_user.properties.build(property_params)
        if @property.save 
            redirect_to property_path(@property)
        else  
            redirect_to new_property_path
        end
    end 

    def show 
        @property = Property.find_by(id: params[:id])
    end

    def edit 
        @property = Property.find_by(id: params[:id])
    end 

    def update
    end

    private 

    def property_params 
        params.require(:property).permit(
            :name, 
            :user_id, 
            :location_id, 
            :bedrooms, 
            :bathrooms, 
            :available,
            amenity_ids: [], 
            location_attributes: [ 
                :name, 
                :state
            ]
        )
    end 
end
