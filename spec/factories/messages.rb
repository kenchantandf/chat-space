FactoryGirl.define do
  factory :message do
    text          'test'
    image         { Faker::Avatar.image }
    user_id       1
    group_id      1
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
