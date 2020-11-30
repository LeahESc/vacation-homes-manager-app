class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :full_name
      t.integer :rating
      t.text :notes

      t.timestamps
    end
  end
end
