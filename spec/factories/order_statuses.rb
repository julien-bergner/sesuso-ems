# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_status do
    description "MyString"
    previous_status_id 1
    next_status_id 1
  end
end
