class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.integer :service_id
      t.string :days
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
