FactoryBot.define do
  factory :user_purchase do
    token              { 'あ' }
    postcode           { '123-1234' }
    shipping_area_id   { 2}
    cities             { '横浜市緑区' }
    address            { '青山1-1-1' }
    building_name      { '柳ビル103' }
    phone_number       { '09012345678' }
  end
end
