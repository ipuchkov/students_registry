FactoryGirl.define do
  factory :subject do
    sequence(:title) {|n| "subject #{n}"}
  end
end
