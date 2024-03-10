class CreateLegs < ActiveRecord::Migration[7.1]
  def change
    create_table :legs do |table|
      table.belongs_to :trip, null: false
      table.belongs_to :hotel
      table.belongs_to :rental_car
      table.string :leg_type, null: false
      table.string :name, null: false
      table.date :start_date, null: false
      table.date :end_date, null: false
      table.timestamps
    end
  end
end
