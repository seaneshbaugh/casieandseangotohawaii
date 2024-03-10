class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |table|
      table.string :name
      table.belongs_to :restaurant
      table.string :notes
    end
  end
end
