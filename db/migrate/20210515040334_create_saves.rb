class CreateSaves < ActiveRecord::Migration[5.0]
  def change
    create_table :saves do |t|
      t.string :name
      t.string :username

      t.timestamps
    end
  end
end
