class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
    @user_purchase = UserPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new(user_purchase_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_purchase_params
    params.require(:user_purchase).permit(:postcode, :shipping_area_id, :cities, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: user_purchase_params[:token],
      currency:'jpy'
    )
  end
end
