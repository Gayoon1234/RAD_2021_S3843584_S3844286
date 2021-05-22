class AddStockDateToItem < ActiveRecord::Migration[5.2]
  def change
    
    add_column :items, :stock_date, :integer
    
  end
end
