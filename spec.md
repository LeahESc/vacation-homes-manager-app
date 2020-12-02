  [x] Uses the Ruby on Rails Framework
  Models: 
    [x] one has_many 
            user has_many properties
            location has_many properties
            property has_many amenities
    [x] one belongs_to 
            property belongs_to user
            property belongs_to location
    [x] two has_many :through
            user has_many :locations, through: :properties
            location has_many :users, through: :properties 
            properties has_many :amenties, through: :property_amenities
            amenities has_many :properties, through: :property_amenities
    [x] Joins table must have user-submittable attributes 
            main joins table: Properties has many user-submittable attributes including:
                #bedrooms
                #bathrooms 
                amenities
                availability
                location
    [x] must include reasonable validations for simple attributes
            validates that property name must be present and property must have location, bedrooms and bathrooms

[x] Include at least one ActiveRecord scope method
        scope :latest, -> { order created_at: :desc}
        scope :local, -> (locationid) { where(location_id: locationid)}
[x] Include third party signup/login (how e.g. Devise/OmniAuth)  
        OmniAuth with GitHub & OAuth Google 
[x] Include nested resource show or index   
        Has nested show route (locations/:id/properties/:id) that allows users to view a specific property within a location
- [x] Include nested resource "new" form 
        Has nested new route (location_new_property_path)where the new property form already knows it's location
- [x] Include form display of validation errors 
        Uses field_with_error as a class to add styling to display errors


Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate
