class ChangeColumnInUsers < ActiveRecord::Migration[5.2]
  def change
    
    change_column_default :users, :firstCheckout, true 
    
  end
end
