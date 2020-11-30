class Property < ApplicationRecord
    belongs_to :location
    belongs_to :user
    has_many :property_amenities
    has_many :amenities, through: :property_amenities
    accepts_nested_attributes_for :location
end
