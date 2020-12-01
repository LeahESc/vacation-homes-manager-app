class PropertiesController < ApplicationController
    before_action :redirect
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    
    def index 
        @properties = current_user.properties.latest
    end 

    def new 
        @property = Property.new(location_id: params[:location_id]) 
        @amenitites = Amenity.all 
    end 

    def create 
        @property = current_user.properties.build(property_params)
        if @property.save 
            redirect_to property_path(@property)
        else  
            render :new
        end
    end 

    def show
        if @property
            render :show 
        else  
            flash[:error]  = "I'm sorry, you don't have access to view that page."
            redirect_to properties_path
        end 
    end

    def edit 
        if @property
            render :edit 
        else  
            flash[:error]  = "I'm sorry, you don't have access to view that page."
            redirect_to properties_path
        end 
    end 

    def update
        if @property.update(property_params)
            redirect_to property_path(@property)
        else 
            render :edit
        end 
    end

    def destroy 
        @property.destroy
        redirect_to properties_path
    end 

    private 

    def set_property 
        @property = current_user.properties.find_by(id: params[:id])
    end
    
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
