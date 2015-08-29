FactoryGirl.define do
  factory :semester do
    sequence(:number) {|n| n}
    group nil
  end

end
