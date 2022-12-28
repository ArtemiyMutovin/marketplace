FactoryBot.define do
  sequence :title do |n|
    "title#{n}"
  end

  factory :product do
    title
    price { 100 }
    category_id { create(:category).id }

    trait :invalid do
      title { nil }
    end
  end
end
