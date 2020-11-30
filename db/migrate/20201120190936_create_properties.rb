class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :user_id
      t.integer :location_id
      t.boolean :available

      t.timestamps
    end
  end
end
