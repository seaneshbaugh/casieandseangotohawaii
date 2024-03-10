class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |table|
      table.belongs_to :linkable, polymorphic: true
      table.string :link_type
      table.string :url
      table.timestamps
    end
  end
end
