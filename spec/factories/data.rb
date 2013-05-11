# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :datum do
    chair 1
    value 1.5
    user "MyString"
    timestamp "2013-04-06 12:45:59"
  end
end
