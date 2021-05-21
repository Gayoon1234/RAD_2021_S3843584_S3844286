class RenameSizeInCart < ActiveRecord::Migration[5.2]
  def change
    
    rename_column :carts, :size, :clothing_size
    
  end
end
