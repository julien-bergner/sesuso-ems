class Seat < ActiveRecord::Base
  attr_accessible :ball_table_id, :caption, :order_id, :position, :price, :seat_status
end
