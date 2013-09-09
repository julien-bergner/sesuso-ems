class Customer < ActiveRecord::Base
  attr_accessible :city, :email, :first_name, :last_name, :salutation, :street_name, :street_number, :zip_code
  validates_presence_of :city, :email, :first_name, :last_name, :salutation, :street_name, :street_number, :zip_code, message: "Bitte f&uuml;llen Sie dieses Feld aus."
  validates_format_of :email, :with => /(^$|^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$)/i, :message => "Bitte geben Sie eine g&uuml;ltige E-Mail-Adresse ein."
  has_many :orders

end
