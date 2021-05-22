class AddPopularityToItem < ActiveRecord::Migration[5.2]
  def change
    
    add_column :items, :popularity, :integer
  end
end
