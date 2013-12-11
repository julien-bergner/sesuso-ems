class Product < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  attr_accessible :caption, :category_id, :number, :price; :quantity

  has_many :order_items

  def get_price()
    number_to_currency(self.price, unit: "&euro;", separator: ",", delimiter: "", format: "%n %u").gsub(' ','&nbsp;').html_safe
  end

  def truncate_float_if_whole_number(number)
    if number.modulo(1) == 0
      number = number.to_int
    end
    return number
  end
end
