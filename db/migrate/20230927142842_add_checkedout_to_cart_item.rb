class AddCheckedoutToCartItem < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :checkedout, :boolean
  end
end
