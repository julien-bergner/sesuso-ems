class BallTable < ActiveRecord::Base
  attr_accessible :id, :caption, :floor, :height, :position_x, :position_y, :price, :radius, :table_type, :width

  has_one :seat


  def get_number_of_available_seats
    self.seat.quantity - OrderItem.all.select{ |a| a.product_id == self.seat.id }.length
  end

  def get_price_per_seat()
    return "#{truncate_float_if_whole_number(self.seat.price)}".html_safe
  end

  def truncate_float_if_whole_number(number)
    if number.modulo(1) == 0
      number = number.to_int
    end
    return number
  end

end

