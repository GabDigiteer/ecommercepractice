class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :productid
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end