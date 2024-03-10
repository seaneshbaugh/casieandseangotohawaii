class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |table|
      table.belongs_to :meal, null: false
      table.belongs_to :person, null: false
      table.decimal :rating, null: false
      table.timestamps
    end
  end
end
