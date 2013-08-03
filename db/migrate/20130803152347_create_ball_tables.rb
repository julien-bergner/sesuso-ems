class CreateBallTables < ActiveRecord::Migration
  def change
    create_table :ball_tables do |t|
      t.integer :position
      t.string :caption
      t.string :type
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
