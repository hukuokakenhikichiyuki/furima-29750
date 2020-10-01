# class PurchasesController < ApplicationController
#   def index
#   end

#   def new
#     @user_purchase = UserPurchase.new
#   end

#   def create
#     @user_purchase = UserPurchase.new(purchase_params)
#     if @user_purchase.valid?
#       @user_purchase.save
#       redirect_to root_path
#     else
#       render index
#     end
#   end

#   private

#   def purchase_params
#     params.permit(:nickname, :email, :token, :price, :postcode, :shipping_area_id, :cities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: current_user.id)
#   end
# end
