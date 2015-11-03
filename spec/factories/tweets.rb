FactoryGirl.define do
  factory :tweet do
    body { Faker::Lorem.sentence }
    user_id 1
  end

end
