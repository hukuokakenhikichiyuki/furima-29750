require 'rails_helper'
describe User do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品がうまく行く時' do
      it 'image, name, catefory_id, description, product_condition_id, shipping_fee_burden_id, shipping_id, estimated_date_id, price が存在していれば商品が出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品がうまく行かない時' do
      it '画像は一枚必須である' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報のidが１だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態の情報のidが１だと登録できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 1")
      end
      it '配送料の負担の情報のidが１だと登録できない' do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden must be other than 1")
      end
      it '発送元の地域の情報がのidが１だと登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it '発送までの日数の情報がのidが１だと登録できない' do
        @item.estimated_shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date must be other than 1")
      end
      it '価格についての情報が空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は、半角数字でなければ登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字で入力してください。")
      end
      it '価格の範囲が、¥300以下だと登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300以上で入力してください。")
      end
      it '価格の範囲が、¥9,999,999以上だと登録できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥9,999,999以下で入力してください。")
      end
    end
  end
end
