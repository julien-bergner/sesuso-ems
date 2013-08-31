class CreateBallTables < ActiveRecord::Migration
  def change
    create_table :ball_tables do |t|
      t.string :caption
      t.string :type
      t.integer :floor
      t.float :price
      t.integer :position_x
      t.integer :position_y
      t.integer :width
      t.integer :height
      t.integer :radius

      t.timestamps
    end
  end
end
