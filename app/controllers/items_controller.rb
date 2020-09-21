class ItemsController < ApplicationController
    def index
      @items = Item.order("created_at DESC")
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
    end

    private

    def item_params
      params.require(:item).permit(:category_id, :product_condition_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_shipping_date)
    end
end
