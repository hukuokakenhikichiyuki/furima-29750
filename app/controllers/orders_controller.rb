class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]

  def index
    if @item.user_id == current_user.id
      redirect_to root_path if @item.purchase
    end
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(user_purchase_params)
    pp @user_purchase
    if @user_purchase.valid?
      puts "xxxxxxxxxxxxxxxxxxxxxxxx"
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      puts "yyyyyyyyyyyyyyyyyyyyyyyyyy"
      render :index
    end
  end

  private

  def user_purchase_params
    params.require(:user_purchase).permit(:postcode, :shipping_area_id, :cities, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    puts ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: user_purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
