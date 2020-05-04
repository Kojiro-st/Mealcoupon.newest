FactoryBot.define do
  factory :post do
    shopname              {"00000000"}
    address               {"00000000"}
    expirydate            {"00000000"}
    foodname              {"00000000"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end