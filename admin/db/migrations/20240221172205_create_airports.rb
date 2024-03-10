class CreateAirports < ActiveRecord::Migration[7.1]
  def change
    create_table :airports do |table|
      table.string :name, null: false
      table.string :code, null: false
      table.string :address, null: false
      table.string :phone
      table.string :frommers_guide_book_page
      table.timestamps
    end
  end
end
