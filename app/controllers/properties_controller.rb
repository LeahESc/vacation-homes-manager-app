class PropertiesController < ApplicationController
    before_action :redirect 
    
    def index 
        @properties = current_user.properties
    end 

    def new 
        @property = Property.new(location_id: params[:location_id]) 
        @amenitites = Amenity.all 
    end 

    def create 
        # binding.pry 
        @property = current_user.properties.build(property_params)
        if @property.save 
            redirect_to property_path(@property)
        else  
            render :new
        end
    end 

    def show 
        @property = current_user.properties.find_by(id: params[:id])
    end

    def edit 
        @property = current_user.properties.find_by(id: params[:id])
    end 

    def update
        # binding.pry
        @property = current_user.properties.find_by(id: params[:id])
        if @property.update(property_params)
            redirect_to property_path(@property)
        else 
            flash[:error] = 'There was a problem updating your property, please try again.'
            render :edit
        end 
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
