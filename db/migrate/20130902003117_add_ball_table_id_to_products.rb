class AddBallTableIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ball_table_id, :integer
  end
end
