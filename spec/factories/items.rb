FactoryBot.define do
  factory :item do
    association :user
    name                         { 'ああああ' }
    category_id                  { 2 } 
    description                  { 'ああああ' }
    product_condition_id         { 2 }
    shipping_fee_burden_id       { 2 }
    shipping_area_id             { 2 }
    estimated_shipping_date_id   { 2 }
    price                        { 2000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
