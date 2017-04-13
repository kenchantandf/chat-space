FactoryGirl.define do

  password = Faker::Internet.password

  factory :user do
    name          { Faker::Name.name }
    email         { Faker::Internet.email }
    password      password
    password_confirmation    password
    created_at    { DateTime.now }
    updated_at    { DateTime.now }
  end
end
