class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #Item.create
    if @item.save
      redirect_to root_path
    else      
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :image, :price, :description, :category_id, :product_condition_id, :cost_id, :shipping_day_id, :prefecture_id).merge(user_id: current_user.id)
  end 
end
