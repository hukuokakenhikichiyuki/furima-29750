class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postcode,                   null: false
      t.integer :prefectures,               null: false
      t.string :cities,                     null: false
      t.string :address,                    null: false
      t.string :building_name
      t.string :phone_number,               null: false
      t.integer :price,                     null: false
      t.references :purchase_detail_id,     null: false
      t.timestamps
    end
  end
end