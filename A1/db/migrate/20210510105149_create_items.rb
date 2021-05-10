class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :section
      t.decimal :price
      t.string :item_type
      t.string :colour
      t.string :company

      t.timestamps
    end
  end
end
