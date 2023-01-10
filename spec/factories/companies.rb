FactoryBot.define do
  sequence :name do |n|
    "name#{n}"
  end

  factory :company do
    name
  end

  trait :invalid do
    name { nil }
  end
end
