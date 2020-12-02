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
    end

    def edit 
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
        if !@property
            flash[:error]  = "I'm sorry, you don't have access to view that page."
            redirect_to properties_path
        end 
    end
    
    def property_params 
        params.require(:property).permit(
            :name, 
            :user_id, 
            :location_id, 
            :bedrooms, 
            :bathrooms, 
            :available,
            :avatar,
            amenity_ids: [], 
            location_attributes: [ 
                :name, 
                :state
            ],
            amenities_attributes: [ 
                :name, 
            ]
        )
    end 
end
