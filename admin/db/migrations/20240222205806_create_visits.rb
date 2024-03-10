class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |table|
      table.belongs_to :attraction
      table.string :notes
      table.string :notes_danger
      table.timestamps
    end
  end
end
