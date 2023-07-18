FactoryBot.define do

  factory :book do
    library
    title { "blah blah" }
    available { true }
    author
    
    trait :active do 
      available { true }
      author
      user 
    end

    trait :checked_out do 
      available { false }
      author
      user 
    end
  end

end
