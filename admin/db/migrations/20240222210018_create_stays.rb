class CreateStays < ActiveRecord::Migration[7.1]
  def change
    create_table :stays do |table|
      table.belongs_to :trip
      table.belongs_to :leg
      table.belongs_to :hotel
      table.string :price
      table.string :room_type
      table.timestamps
    end
  end
end
