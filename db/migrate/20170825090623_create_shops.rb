class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.references :city
      t.references :area
      t.references :user
      t.references :category
      t.timestamps
    end
    add_index :shops,[:area_id , :city_id, :user_id]
  end
end
