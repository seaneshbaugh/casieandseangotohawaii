class CreatePictures < ActiveRecord::Migration[7.1]
  def change
    create_table :pictures do |table|
      table.belongs_to :event
      table.belongs_to :photographer
      table.string :filename
      table.string :title
      table.string :description
      table.timestamps
    end
  end
end
