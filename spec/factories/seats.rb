# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seat do
    ball_table_id 1
    order_id 1
    position 1
    caption "MyString"
    price 1.5
    seat_status "MyString"
  end
end
