class AddItemSizeToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_size, :string
  end
end
