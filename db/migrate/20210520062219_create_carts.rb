class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :username
      t.string :itemID
      t.string :colour
      t.string :quantity
      t.string :integer

      t.timestamps
    end
  end
end
