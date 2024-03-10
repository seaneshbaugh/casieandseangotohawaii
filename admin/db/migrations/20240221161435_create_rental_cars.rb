class CreateRentalCars < ActiveRecord::Migration[7.1]
  def change
    create_table :rental_cars do |table|
      table.string :company, null: false
      table.string :car_make_model, null: false
      table.string :price, null: false
      table.belongs_to :pickup_location_airport, null: false
      table.string :pickup_datetime, null: false
      table.belongs_to :dropoff_location_airport, null: false
      table.string :dropoff_datetime, null: false
      table.timestamps

      table.foreign_key(:airports, column: :pickup_location_airport_id)
      table.foreign_key(:airports, column: :dropoff_location_airport_id)
    end
  end
end
