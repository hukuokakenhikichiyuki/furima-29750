require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end
    context '商品の購入がうまく行くとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@user_purchase).to be_valid
      end
      it '建物名は空でも保存できる' do
        @user_purchase.building_name = nil
        expect(@user_purchase).to be_valid
      end
    end
    context '商品の購入がうまく行かないとき' do
      it 'カード情報が空だと保存できないこと' do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @user_purchase.postcode = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ形式でないと保存できないこと' do
        @user_purchase.postcode = 1_234_567
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postcode Input correctly')
      end
      it '都道府県の情報のidが１だと保存できないこと' do
        @user_purchase.shipping_area_id = 1
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it '市町村が空だと保存できないこと' do
        @user_purchase.cities = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Cities can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @user_purchase.address = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @user_purchase.phone_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は１１桁以内でなければ保存できない' do
        @user_purchase.phone_number = '12345678900000'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone number 電話番号は11桁以内で登録してください')
      end
      it '電話番号にハイフンがあれば保存できない' do
        @user_purchase.phone_number = '12-32-1'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone number ハイフンは不要です')
      end
    end
  end
end
