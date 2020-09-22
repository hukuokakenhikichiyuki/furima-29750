class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    belongs_to_active_hash :category
    belongs_to_active_hash :product_condition
    belongs_to_active_hash :shipping_fee_burden
    belongs_to_active_hash :shipping_area
    belongs_to_active_hash :estimated_shipping_date

    validates_presence_of :image, :name, :price, :description, :category_id, :product_condition_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_shipping_date_id

    validates :category_id, :product_condition_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_shipping_date_id, numericality: { other_than: 1 }
end
