class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :gift_card_number_id, :quantity
  belongs_to :order
  belongs_to :product
end
