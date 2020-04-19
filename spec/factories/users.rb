# FactoryBot.define do
#   password = Faker::Internet.password(min_length: 6)

#   factory :user do
#     email { Faker::Internet.email }
#     password { password }
#     password_confirmation { password }
#   end
# end

FactoryBot.define do
  factory :user do
    name { "name" }
    email { "email@email.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
  end
end