class AddClothingSizeToCart < ActiveRecord::Migration[5.2]
  def change
    
    add_column :carts, :clothing_size, :string
    
  end
end
