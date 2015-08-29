FactoryGirl.define do
  factory :student do
    group nil
    name Faker::Name.first_name
    surname Faker::Name.last_name
    email Faker::Internet.email
    characteristic Faker::Lorem.sentence(5)
    ip Faker::Internet.ip_v4_address
  end
end
