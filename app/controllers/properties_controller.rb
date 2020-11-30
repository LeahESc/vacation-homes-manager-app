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
        @property = Property.new(property_params)
    end 

    def edit 
        @property = Property.find_by(id: params[:id])
    end 

    def update
    end

    private 

    def property_params 
        params.require(:property).permit(:name, 
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
