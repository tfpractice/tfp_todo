require 'faker'
FactoryGirl.define do
  factory :user do
    admin false
    email {Faker::Internet.email}
    username {Faker::Internet.user_name}
    password {Faker::Internet.password}
    to_create {|instance| instance.save!(validate: false) }
  end

  
end
