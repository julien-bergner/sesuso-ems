# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ball_table do
    caption "MyString"
    type ""
    floor 1
    price 1.5
    position_x 1
    position_y 1
    width 1
    height 1
    radius 1
  end
end
