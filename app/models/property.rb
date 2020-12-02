class Property < ApplicationRecord
    belongs_to :location
    belongs_to :user
    has_many :property_amenities
    has_many :amenities, through: :property_amenities
    has_one_attached :avatar
    # scope :available, -> { where(available: true) } 
    scope :latest, -> { order created_at: :desc}
    scope :local, -> (locationid) { where(location_id: locationid)}
    accepts_nested_attributes_for :location, :reject_if => lambda { |a| a[:name].blank? || a[:state].blank? }, :allow_destroy => true
    validates :name, presence: true 
    validates :bedrooms, presence: true
    validates :bathrooms, presence: true

    

    

end
