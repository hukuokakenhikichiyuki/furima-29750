class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    redirect_to user_session_path unless user_signed_in?
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :description, :category_id, :product_condition_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end
end
