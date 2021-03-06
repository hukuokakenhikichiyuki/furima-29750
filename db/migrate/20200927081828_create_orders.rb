class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postcode,                   null: false
      t.integer :shipping_area_id,          null: false
      t.string :cities,                     null: false
      t.string :address,                    null: false
      t.string :building_name
      t.string :phone_number,               null: false
      t.integer :purchase_id,               null: false, foreign_key: true
      t.timestamps
    end
  end
end