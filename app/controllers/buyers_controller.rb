class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create ]
  before_action :item_find,          only: [:index, :create]
  before_action :prevent_url,        only: [:index, :create]


  def index
    #@item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end
  
  def create        
    #@item = Item.find(params[:item_id])    
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buyer_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )      
       @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    params.require(:buyer_address).permit(:post_cord, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end                                                                                                                                                             #↑.idで@itemのレコードを取得する。

  def item_find
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.buyer != nil
       redirect_to root_path
    end
  end  

end
