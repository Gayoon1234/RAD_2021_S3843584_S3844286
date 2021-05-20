class ChangeCartValues < ActiveRecord::Migration[5.0]
  def change
    
    remove_column :carts, :quantity
    remove_column :carts, :itemID
    
    add_column :carts, :quantity, :integer
    add_column :carts, :itemID, :integer
    
  end
end
