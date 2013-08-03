class OrderStatus < ActiveRecord::Base
  attr_accessible :description, :next_status_id, :previous_status_id
end
