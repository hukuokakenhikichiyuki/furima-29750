class UserPurchase

  include ActiveModel::Model
  attr_accessor :token, :postcode, :shipping_area_id, :cities, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token, :postcode, :cities, :address, :phone_number, presence: true

    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Postcode Input correctly"}
    validates :postcode, length: { minimum: 7 }, allow_nil: true

    validates :shipping_area_id, numericality: { other_than: 1, message: "Shipping area must be other than 1" }

    validates :phone_number, length: { maximum: 11, message: "電話番号は11桁以内で登録してください" }, allow_nil: true
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(postcode: postcode, shipping_area_id: shipping_area_id, cities: cities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end