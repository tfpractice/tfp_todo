require 'faker'
FactoryGirl.define do
  factory :user do
    admin false
    email {Faker::Internet.email}
    username {Faker::Internet.user_name}
    password {Faker::Internet.password}
  end

  # factory :list do
  #   title {Faker::Lorem.words(3)}
  #   description {Faker::Lorem.words(3)}
  #   user
  # end
end
