class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :trip_id
      t.integer :route_id
      t.integer :service_id
      t.string :trip_headsign
      t.string :trip_short_name
      t.integer :direction_id
      t.integer :block_id
      t.integer :shape_id
      t.integer :wheelchair_accessible
      t.integer :bikes_allowed

      t.timestamps
    end
  end
end
