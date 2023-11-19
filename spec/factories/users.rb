FactoryBot.define do
  factory :user do
    nickname   {'test'}
    email { "test@example.com" }
    password { "000000" }
    password_confirmation { "000000" }
  end
end