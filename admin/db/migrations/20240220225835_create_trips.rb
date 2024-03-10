class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |table|
      table.string :name, null: false
      table.string :slug, null: false
      table.date :start_date, null: false
      table.date :end_date, null: false
      table.timestamps
    end
  end
end
