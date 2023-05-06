require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_address = FactoryBot.build(:buyer_address, item_id: item.id, user_id: user.id)
  end
  
  describe '商品購入(配送先情報)' do
    context '商品購入(配送先情報)が入力できる場合' do
      it '必要事項を全て入力すると保存できる' do           
        expect(@buyer_address).to be_valid        
      end
      it 'building_name(建物名)がなくても保存できる' do         
        @buyer_address.building_name = ''        
        expect(@buyer_address).to be_valid        
      end
    end

    context '商品購入(配送先情報)が入力できない場合' do
      it 'token(クレジットカード情報)が空だと保存ができない' do
        @buyer_address.token = nil
        @buyer_address.valid?        
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_cord(郵便番号)が空なら保存できない' do
        @buyer_address.post_cord = ''
        @buyer_address.valid?        
        expect(@buyer_address.errors.full_messages).to include("Post cord can't be blank")
      end
      it 'post_cord(郵便番号)が「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @buyer_address.post_cord = '1234567'
        @buyer_address.valid?        
        expect(@buyer_address.errors.full_messages).to include("Post cord is invalid")
      end
      it 'prefecture_id(発送先の地域)が「---」なら保存できない' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?        
        expect(@buyer_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'city(市区町村)が空なら保存できない' do
        @buyer_address.city = ''
        @buyer_address.valid?        
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address(番地)が空なら保存できない' do
        @buyer_address.address = ''
        @buyer_address.valid?        
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_number(電話番号)が空なら保存できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?        
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_number(電話番号)が全角数字だと保存できない' do
        @buyer_address.phone_number = '０９０１２３４５６７８'
        @buyer_address.valid?        
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_number(電話番号)が「ハイフン」有りだと保存できない' do
        @buyer_address.phone_number = '090-12345678'
        @buyer_address.valid?        
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_number(電話番号)が9桁以下だと保存できない' do
        @buyer_address.phone_number = '090123456'
        @buyer_address.valid?             
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_number(電話番号)が12桁以上だと保存できない' do
        @buyer_address.phone_number = '090123456789'
        @buyer_address.valid?             
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
