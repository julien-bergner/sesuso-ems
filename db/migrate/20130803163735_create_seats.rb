class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :ball_table_id
      t.integer :order_id
      t.integer :position
      t.string :caption
      t.float :price
      t.string :seat_status

      t.timestamps
    end
  end
end
