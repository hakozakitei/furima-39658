class PurchaseShippingForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :phone_number, :shipping_origin_id, :city, :address, :building_name, :token

  # バリデーションの定義
  validates :token, :postal_code, :phone_number, :shipping_origin_id, :city, :address, presence: true

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingInfo.create(purchase_id: purchase.id, postal_code: postal_code, phone_number: phone_number, shipping_origin_id: shipping_origin_id, city: city, address: address, building_name: building_name)
  end
end