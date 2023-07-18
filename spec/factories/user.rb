FactoryBot.define do

    factory :user, aliases: [ :author ] do
      name { Faker::Name.name }
      email { Faker::Internet.email }
      status { 1 }
    end

end