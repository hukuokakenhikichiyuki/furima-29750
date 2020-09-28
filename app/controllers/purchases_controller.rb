class PurchasesController < ApplicationController
  def index
  end

  def new
    @purchase = UserPurchase.new
  end

  def create
    @purchase = UserPurchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:token, :postcode, :shipping_area_id, :cities, :address, :builiding_name, :phone_number, :price)
  end
end
