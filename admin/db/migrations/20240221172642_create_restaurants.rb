class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |table|
      table.string :name, null: false
      table.string :priority, null: false
      table.string :address
      table.string :phone
      table.string :hours
      table.string :price_range
      table.string :genre
      table.string :notes
      table.string :frommers_guide_book_page
      table.timestamps
    end
  end
end
