class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :product_condition
    belongs_to_active_hash :shipping_fee_burden
    belongs_to_active_hash :shipping_area
    belongs_to_active_hash :estimated_shipping_date

    validates_presence_of :category, :product_condition, :shipping_fee_burden, :shipping_area, :estimated_shipping_date

    validates :category, :product_condition, :shipping_fee_burden, :shipping_area, :estimated_shipping_date, numericality: { other_than: 1 }
end
