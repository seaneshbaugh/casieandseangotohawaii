class CreateVisitors < ActiveRecord::Migration[7.1]
  def change
    create_table :visitors do |table|
      table.belongs_to :visit
      table.belongs_to :person
      table.timestamps
    end
  end
end
