class CreateDays < ActiveRecord::Migration[7.1]
  def change
    create_table :days do |table|
      table.belongs_to :trip
      table.belongs_to :leg
      table.string :name
      table.date :date
      table.timestamps
    end
  end
end
