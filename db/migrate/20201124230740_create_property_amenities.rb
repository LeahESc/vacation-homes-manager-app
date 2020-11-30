class CreatePropertyAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :property_amenities do |t|
      t.integer :property_id
      t.integer :amenity_id

      t.timestamps
    end
  end
end
