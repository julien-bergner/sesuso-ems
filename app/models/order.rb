class Order < ActiveRecord::Base
  attr_accessible :customer_id, :delivery_method, :order_status_id, :overall_amount, :payment_method
end
