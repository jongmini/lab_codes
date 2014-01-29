class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.belongs_to :product, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
