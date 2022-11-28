FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test"
  end

  factory :user do
    email
    first_name { 'First' }
    last_name { 'Last' }
  end
end
