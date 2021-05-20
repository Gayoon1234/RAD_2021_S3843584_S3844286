class AddimagestoItems < ActiveRecord::Migration[5.0]
  def change
    
    add_column :items, :image_url2, :string
    add_column :items, :image_url3, :string
    
  end
end
