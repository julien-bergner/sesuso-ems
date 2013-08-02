class Customer < ActiveRecord::Base
  attr_accessible :city, :email, :first_name, :last_name, :salutation, :street_name, :street_number, :zip_code
end
