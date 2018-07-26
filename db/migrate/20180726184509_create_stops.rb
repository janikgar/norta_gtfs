class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.integer :stop_id
      t.string :stop_code
      t.string :stop_name
      t.string :stop_desc
      t.float :stop_lat
      t.float :stop_lon
      t.integer :wheelchair_boarding

      t.timestamps
    end
  end
end
