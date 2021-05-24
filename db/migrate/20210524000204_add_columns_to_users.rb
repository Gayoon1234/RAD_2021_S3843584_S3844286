class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstCheckout, :boolean, default: false
    add_column :users, :isSubscribed, :boolean, default: false
  end
end
