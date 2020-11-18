class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
      if@order.valid?
        @order.save
        redirect_to root_path
    else
      render action: :index
    end
  end

  private
  # 全てのストロングパラメーターを1つに統合
  def order_params
    params.require(:order).permit(:token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def move_to_index
    @item = Item.find(params[:item_id])
    if (current_user.id == @item.user_id) || (@item.purchase != nil)
      redirect_to root_path
    end
  end
end
