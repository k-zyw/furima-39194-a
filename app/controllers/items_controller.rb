class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update ]

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

  def show    
  end

  def edit   
  end

  def update    
    if @item.update(item_params)
      redirect_to root_path
    else      
      render :edit
    end  
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :image, :price, :description, :category_id, :product_condition_id, :cost_id, :shipping_day_id, :prefecture_id).merge(user_id: current_user.id)
  end 

  def move_to_index
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to action: :index
    end
  end 

  def set_item
    @item = Item.find(params[:id])
  end
end
