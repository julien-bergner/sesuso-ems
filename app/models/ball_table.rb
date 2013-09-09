class BallTable < ActiveRecord::Base
  attr_accessible :id, :caption, :floor, :height, :position_x, :position_y, :price, :radius, :table_type, :width

  has_one :seat


  def get_number_of_available_seats
    used_amount = 0
    OrderItem.all.select{ |a| a.product.id == self.seat.id }.each{ |b| used_amount += b.quantity}
    return self.seat.quantity - used_amount
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

