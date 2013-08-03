class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_status_id
      t.float :overall_amount
      t.string :delivery_method
      t.string :payment_method
      t.integer :customer_id

      t.timestamps
    end
  end
end
