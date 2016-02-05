require 'faker'

FactoryGirl.define do
  factory :list do
    title {Faker::Lorem.words(3)}
    description {Faker::Lorem.words(15)}
    association :user
  end
end
