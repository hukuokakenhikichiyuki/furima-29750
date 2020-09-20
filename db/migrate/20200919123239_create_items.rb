class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                        null: false
      t.integer :category,                    null: false
      t.integer :price,                      null: false
      t.text :description,                   null: false
      t.integer :production_condition,       null: false
      t.integer :shipping_area,              null: false
      t.integer :estimated_shipping_date,    null: false
      t.references :user,                    null: false, foreign_key: true

      t.timestamps
    end
  end
end
