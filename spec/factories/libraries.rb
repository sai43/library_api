FactoryBot.define do
  factory :library do
    name { "Stanford Hall of fame Library" }
    address { Faker::Address.full_address }
  end
end
