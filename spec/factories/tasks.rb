FactoryGirl.define do
  factory :task do
  	association :list
    title {Faker::Lorem.words(3)}
    content {Faker::Lorem.words(15)}
    due_date {Faker::Date.forward(14)}
  end
end
