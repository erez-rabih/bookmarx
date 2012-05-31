# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bookmark do
    user_id 1
    address "http://www.fake.com"
  end
end
