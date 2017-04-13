FactoryGirl.define do
  factory :group do
    name          { Faker::Name.name }
    id       1
    created_at    { DateTime.now }
    updated_at    { DateTime.now }
  end
end
