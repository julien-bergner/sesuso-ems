class Product < ActiveRecord::Base
  attr_accessible :caption, :category_id, :number, :price; :quantity

  def get_price()
    return "#{truncate_float_if_whole_number(self.price)}".html_safe
  end

  def truncate_float_if_whole_number(number)
    if number.modulo(1) == 0
      number = number.to_int
    end
    return number
  end
end
