# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "fake@user.com"
    password "fakepassword"
  end
end
