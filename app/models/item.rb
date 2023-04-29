class Item < ApplicationRecord
  validates  :product_name,           presence: true
  validates  :price,                  presence: true
  validates  :description,            presence: true
  validates  :category_id,            presence: true
  validates  :product_condition_id,   presence: true
  validates  :cost_id,                presence: true
  validates  :shipping_day_id ,       presence: true      
  validates  :prefecture_id,          presence: true

  belongs_to       :user
  has_one_attached :image
end
