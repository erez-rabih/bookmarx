# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bookmark do
    user
    address "http://www.fake.com"
  end
end
