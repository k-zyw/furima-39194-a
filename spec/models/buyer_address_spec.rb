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
  end
end
