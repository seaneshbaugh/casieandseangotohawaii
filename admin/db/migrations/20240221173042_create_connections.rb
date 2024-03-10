class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |table|
      table.belongs_to :flight, null: false
      table.string :flight_number, null: false
      table.belongs_to :connection_airport, null: false
      table.string :connection_arrival_time, null: false
      table.string :connection_departure_time, null: false
      table.string :connection_layover_duration, null: false
      table.string :connection_duration, null: false
      table.timestamps
    end
  end
end
