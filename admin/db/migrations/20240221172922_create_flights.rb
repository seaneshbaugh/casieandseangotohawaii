class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |table|
      table.string :flight_number
      table.belongs_to :departure_airport
      table.string :departure_time
      table.string :duration
      table.belongs_to :arrival_airport
      table.string :arrival_time
      table.string :total_duration
      table.timestamps
    end
  end
end
