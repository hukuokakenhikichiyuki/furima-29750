class UserDonation

  include ActiveModel::Model
  attr_accessor :token, :postcode, :shipping_area_id, :cities,  :address, :building_name, :phone_number, :price

  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :phone_number, format: {with: /\A[0-9]{3}[0-9]{4}[0-9]{4}\z/, message: "is not invalid. Include hyphen(-)"}

  def save
    user = User.create(token: token)
    item = Item.create(image: image, name: name, price: price, description: description, category_id: category_id, product_condition_id: product_condition_id, shipping_fee_burden_id: shipping_fee_burden_id, shipping_area_id: shipping_area_id, estimated_shipping_date_id: estimated_shipping_date_id, user_id: user_id)
    Order.create(postcode: postcode, shipping_area_id: shipping_area_id, cities: cities, address: address, building_name: building_name, phone_number: phone_number, user_id: user_id)
    Purchase.create(item_id: item_id, user_id: user_id)
  end
end