class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                            null: false
      t.integer :category_id,                    null: false
      t.integer :price,                          null: false
      t.text :description,                       null: false
      t.integer :product_condition_id,           null: false
      t.integer :shipping_fee_burden_id,         null: false
      t.integer :shipping_area_id,               null: false
      t.integer :estimated_shipping_date_id,     null: false
      t.references :user,                        null: false, foreign_key: true

      t.timestamps
    end
  end
end