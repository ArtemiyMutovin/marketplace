FactoryBot.define do
  factory :seller do
    email { 'admin@mail' }
    first_name { 'David' }
    last_name { 'James' }
    type { 'Seller' }
    password { '123456' }
    password_confirmation { '123456' }
    confirmed_at { Time.zone.now }
  end
end
