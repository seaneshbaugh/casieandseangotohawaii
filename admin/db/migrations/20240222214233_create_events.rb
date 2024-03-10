class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |table|
      table.belongs_to :leg
      table.belongs_to :day
      table.belongs_to :eventable, polymorphic: true
      table.integer :order, null: false, default: 0
      table.timestamps
    end
  end
end
