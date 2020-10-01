class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :purchase
  belongs_to :user
  
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :estimated_shipping_date

  validates_presence_of :image, :name, :price, :description, :category_id, :product_condition_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_shipping_date_id

  validates :category_id, :product_condition_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_shipping_date_id, numericality: { other_than: 1 }

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください。' }

  validates :price, numericality: { greater_than_or_equal_to: 300, message: 'は¥300以上で入力してください。' }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999, message: 'は¥9,999,999以下で入力してください。' }
end
