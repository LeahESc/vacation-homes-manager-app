module ApplicationHelper

    def location_set(property)
        if !property.location_id.nil? 
        "f.hidden_field :location_id".html_safe
        end
    end 
end
