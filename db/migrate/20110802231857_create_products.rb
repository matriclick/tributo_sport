class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :supplier_id
      t.integer :product_type_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
