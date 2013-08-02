# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    salutation "MyString"
    first_name "MyString"
    last_name "MyString"
    street_name "MyString"
    street_number "MyString"
    zip_code "MyString"
    city "MyString"
    email "MyString"
  end
end
