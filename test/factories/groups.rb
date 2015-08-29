FactoryGirl.define do
  factory :group do
    number Faker::Number.hexadecimal(3).to_s
    course nil
  end

end
