class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name,       null: false 
      t.text    :item_more,       null: false 
      t.integer :category,        null: false 
      t.integer :condition,       null: false 
      t.integer :delivery_charge, null: false 
      t.integer :prefecture,      null: false  
      t.integer :days_to_ship,    null: false 
      t.integer :price,           null: false    
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
