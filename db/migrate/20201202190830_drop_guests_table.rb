class DropGuestsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :guests
  end

end
