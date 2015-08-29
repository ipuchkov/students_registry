FactoryGirl.define do
  factory :student do
    group nil
    sequence(:name) { Faker::Name.first_name }
    sequence(:surname) { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.email }
    sequence(:ip) { Faker::Internet.ip_v4_address }
    sequence(:characteristic) { Faker::Lorem.sentence(5) }
  end
end
