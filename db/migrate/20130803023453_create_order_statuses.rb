class CreateOrderStatuses < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :description
      t.integer :previous_status_id
      t.integer :next_status_id

      t.timestamps
    end
  end
end
