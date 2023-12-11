class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :phone_number, :shipping_origin_id, :city, :address, :building_name, :token

  # バリデーションの定義
  with_options presence: true do
  validates :user_id, :item_id
  validates :token
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
  validates :shipping_origin_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city
  validates :address


  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingInfo.create(purchase_id: purchase.id, postal_code: postal_code, phone_number: phone_number, shipping_origin_id: shipping_origin_id, city: city, address: address, building_name: building_name)
  end
end