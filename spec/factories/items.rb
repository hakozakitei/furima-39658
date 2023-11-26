FactoryBot.define do
  factory :item do
    name { "テストアイテム" }
    description { "テストアイテムの説明" }
    category_id { 2 } 
    condition_id { 2 } 
    shipping_fee_burden_id { 2 } 
    shipping_origin_id { 2 } 
    shipping_day_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end