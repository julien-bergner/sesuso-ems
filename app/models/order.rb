class Order < ActiveRecord::Base
  attr_accessible :customer_id, :delivery_method, :order_status_id, :overall_amount, :payment_method
  has_many :order_items
  belongs_to :customer

  def get_summary

    rows = Array.new

    self.order_items.each do |order_item|
      row = Array.new
      row.push(order_item.quantity.to_s + "x")
      if order_item.product.is_a?(Seat)
        ballTable = BallTable.find(order_item.product.ball_table_id)
        row.push(order_item.product.caption + " an " + ballTable.caption)
      else
        row.push(order_item.product.caption)
      end
      row.push("je #{order_item.product.get_price} &euro;".html_safe)
      row.push("= #{order_item.product.get_price.to_i * order_item.quantity} &euro;".html_safe)

      rows.push(row)
    end

    return rows
  end

  def get_short_summary

    rows = Array.new

    self.order_items.each do |order_item|
      row = Array.new
      row.push(order_item.quantity.to_s + "x")
      if order_item.product.is_a?(Seat)
        ballTable = BallTable.find(order_item.product.ball_table_id)
        row.push(order_item.product.caption + " an " + ballTable.caption)
      else
        row.push(order_item.product.caption)
      end

      rows.push(row)
    end

    return rows
  end

  def get_overall_amount
    self.overall_amount = 0

    self.order_items.each do |order_item|

      row_price = order_item.product.get_price.to_i * order_item.quantity
      self.overall_amount += row_price

    end

    return truncate_float_if_whole_number(self.overall_amount)

  end

  def truncate_float_if_whole_number(number)
    if number.modulo(1) == 0
      number = number.to_int
    end
    return number
  end

  def send_confirmation_mail
    OrderTicketsWorkflowMailer.confirmation_mail(self).deliver!
  end

  def cancel

    unless self.customer.nil? then
      puts "Customer deleted:"
      puts customer.inspect
      logger.info("Customer deleted:")
      logger.info(customer.inspect)
      self.customer.destroy
    end

    puts "Order Items deleted:"
    logger.info("Order Items deleted:")
    self.order_items.each do |i|
      puts i.inspect
      logger.info(i.inspect)
      i.destroy
    end

    puts "Order deleted:"
    puts self.inspect
    logger.info("Order deleted:")
    logger.info(self.inspect)
    self.destroy
  end

  def self.clean_up
    puts "Orders clean up started:"
    logger.info("Orders clean up started:")
    Order.where("created_at < ?", DateTime.current - 15.minutes)
    .select{|o| o.order_status_id.nil?}.each{|o| o.cancel}
    puts "Orders clean up finished."
    logger.info("Orders clean up finished.")
  end

end
