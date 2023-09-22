class Removeproductid < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :productid
  end
end
