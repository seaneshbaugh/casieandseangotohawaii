class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |table|
      table.string :name, null: false
      table.string :address
      table.string :phone
      table.string :notes
      table.string :frommers_guide_book_page
      table.timestamps
    end
  end
end
