FactoryBot.define do
  factory :shipping_info do
    postal_code { "MyString" }
    phone_number { "MyString" }
    shipping_origin_id { 1 }
    city { "MyString" }
    address { "MyString" }
    building_name { "MyString" }
    purchase { nil }
  end
end
