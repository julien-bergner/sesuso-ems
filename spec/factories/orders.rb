# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    order_status_id 1
    overall_amount 1.5
    delivery_method "MyString"
    payment_method "MyString"
    customer_id 1
  end
end
