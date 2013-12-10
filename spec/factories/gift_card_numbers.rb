# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift_card_number do
    number "MyString"
    activated false
  end
end
