class Item < ApplicationRecord
  validates  :product_name,           presence: true
  validates  :price,                  presence: true
  validates  :description,            presence: true
  validates  :category_id,            presence: true
  validates  :product_condition_id,   presence: true
  validates  :cost_id,                presence: true
  validates  :shipping_day_id ,       presence: true      
  validates  :prefecture_id,          presence: true
  validates  :image,                  presence: true
  

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

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' } #←価格は半角数字のみ保存可能であること
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
            
  #↑numericalityで整数のみにする設定や数値の最大値、最小値を設定できる
  #only_integer: trueで整数値のみに設定
  #greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}で最小値、最大値を設定
end
