class Item < ApplicationRecord
  has_one_attached :image
end
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :shipping_origin
  belongs_to :shipping_day

  # バリデーション
  validates :name, :description, :price, :image, presence: true
  validates :category_id, :condition_id, :shipping_fee_burden_id, :shipping_origin_id, :shipping_day_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
