class Property < ApplicationRecord
    belongs_to :location
    belongs_to :user
    has_many :property_amenities
    has_many :amenities, through: :property_amenities
    accepts_nested_attributes_for :location, :reject_if => lambda { |a| a[:name].blank? || a[:state].blank? }, :allow_destroy => true
end
