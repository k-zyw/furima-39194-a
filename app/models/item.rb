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

  extend ActiveHash::Associations::ActiveRecordExtensions #←アクティブハッシュ継承(アソシエーションを組む)14~25行目まで
  belongs_to :category
  belongs_to :product_condition
  belongs_to :cost
  belongs_to :shipping_day
  belongs_to :prefecture

  validates :category_id,           numericality:{ other_than: 1 , message: "can't be blank" } #←ジャンルの選択が「---」の時は保存できないようにする
  validates :product_condition_id,  numericality:{ other_than: 1 , message: "can't be blank" }
  validates :cost_id,               numericality:{ other_than: 1 , message: "can't be blank" }
  validates :shipping_day_id,       numericality:{ other_than: 1 , message: "can't be blank" }
  validates :prefecture_id,         numericality:{ other_than: 1 , message: "can't be blank" }
end
