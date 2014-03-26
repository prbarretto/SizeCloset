FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end

  factory :store do
    store { Faker::Company.name }
  end

  factory :category do
    category { Faker::Commerce.product_name }
  end

  factory :size do
    size { Faker::Lorem.characters(2) }
  end
end
