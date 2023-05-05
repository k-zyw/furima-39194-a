class BuyerAddress
  include ActiveModel::Model
  attr_accessor :post_cord, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

    validates :token, presence: true
    validates :prefecture_id, numericality: {other_than: 1}

    with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_cord,    format: {with: /\A[0-9]{3}-[0-9]{4}\z/}    
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}+\z/}
  end

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)

    Address.create(post_cord: post_cord, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end


end