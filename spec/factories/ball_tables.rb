# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ball_table do
    position 1
    caption "MyString"
    type ""
    description "MyString"
    price 1.5
  end
end
