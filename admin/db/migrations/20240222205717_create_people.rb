class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |table|
      table.string :name
      table.timestamps
    end
  end
end
