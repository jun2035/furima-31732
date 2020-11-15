class ItemsController < ApplicationController
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :shipping_id, :prefecture_id, :day_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id != item.user_id
      redirect_to action: :index
    elsif !user_signed_in?
      render template: '/devise/sessions/new'
    elsif item.purchase != nil
      redirect_to action: :index
    end
  end
end