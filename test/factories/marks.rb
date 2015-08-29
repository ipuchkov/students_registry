FactoryGirl.define do
  factory :mark do
    sequence(:value) { Faker::Number.between(3,5) }
    semester nil
    student nil
    subject nil

    trait :excellent do
      value 5
    end
  end

end
