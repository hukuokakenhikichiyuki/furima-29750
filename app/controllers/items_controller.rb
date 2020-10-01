class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_current_user, only: [:edit, :update]

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

  def update
    if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      elsif @item.try(params[:image])
        redirect_to item_path
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if @item.user_id == current_user.id
      if @item.destroy
        redirect_to root_path
      else
        redirect_to :show
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :description, :category_id, :product_condition_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_current_user
    redirect_to root_path if @item.user_id != current_user.id
  end
end
