class AddFieldsToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :agency_lang, :string
    add_column :agencies, :agency_phone, :string
    add_column :agencies, :agency_fare_url, :string
  end
end
