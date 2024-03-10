class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |table|
      table.belongs_to :meal, null: false
      table.belongs_to :person
      table.string :name, null: false
      table.timestamps
    end
  end
end
