require 'faker'

FactoryGirl.define do
  factory :list do
    title {Faker::Lorem.words(3)}
    description {Faker::Lorem.words(15)}
    association :user
    to_create {|instance| instance.user.save!
     instance.save! }
  end
end
