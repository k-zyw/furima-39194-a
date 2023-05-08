require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it '必要事項を全て入力すると登録できる' do        
        expect(@item).to be_valid
      end
    end
   
    context '商品出品ができない場合' do
      it 'imageが空なら出品できない' do
        @item.image = nil        
        @item.valid?             
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_name(商品名)が空なら出品できない' do        
        @item.product_name = ''        
        @item.valid?        
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'description(説明文)が空なら出品できない' do        
        @item.description = ''                
        @item.valid?        
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_id(カテゴリー)が「---」なら出品できない' do
        @item.category_id = 1        
        @item.valid?        
        expect(@item.errors.full_messages).to include("Category を入力してください")
      end
      it 'product_condition_id(商品の状態)が「---」なら出品できない' do
        @item.product_condition_id = 1       
        @item.valid?        
        expect(@item.errors.full_messages).to include("Product condition を入力してください")
      end
      it 'cost_id(配送料の負担)が「---」なら出品できない' do
        @item.cost_id = 1        
        @item.valid?        
        expect(@item.errors.full_messages).to include("Cost を入力してください")
      end
      it 'prefecture_id(発送元の地域)が「---」なら出品できない' do
        @item.prefecture_id = 1        
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を入力してください")
      end
      it 'shipping_day_id(発送までの日数)が「---」なら出品できない' do
        @item.shipping_day_id = 1       
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day を入力してください")
      end
      it 'price(価格)が空なら出品できない' do
        @item.price = ''        
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'price(価格)は¥300未満では出品できない' do
        @item.price = '100'
        @item.valid?            
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'price(価格)は¥10000000以上では保存できない' do
        @item.price = '10000000'
        @item.valid?        
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end     
      it 'price(価格)は半角数字のみ保存可能であること' do
        @item.price = '１００００'        
        @item.valid?        
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐づいてなければ出品できない' do
        @item.user = nil
        @item.valid?        
        expect(@item.errors.full_messages).to include("User must exist")
      end
        
      
    end
    
  end
end
