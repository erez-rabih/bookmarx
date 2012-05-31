# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "fake#{n}@user.com" }
    password "fakepassword"
  end
end
