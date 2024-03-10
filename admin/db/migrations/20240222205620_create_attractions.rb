class CreateAttractions < ActiveRecord::Migration[7.1]
  def change
    create_table :attractions do |table|
      table.string :name, null: false
      table.string :attraction_type, null: false
      table.string :priority, null: false
      table.string :address, null: false
      table.string :phone
      table.string :hours
      table.string :notes
      table.string :notes_danger
      table.string :frommers_guide_book_page
      table.timestamps
    end
  end
end
