class RemoveClothingSize < ActiveRecord::Migration[5.2]
  def change
    
    remove_column :carts, :clothing_size
    
  end
end
