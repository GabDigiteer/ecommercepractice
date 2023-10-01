class AddDefaultToCheckedoutAttribute < ActiveRecord::Migration[7.0]
  def change
    change_column :cart_items, :checkedout, :boolean, default: false
  end
end
