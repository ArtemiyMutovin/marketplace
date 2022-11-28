FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test"
  end

  factory :user do
    email
  end
end
