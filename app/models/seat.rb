class Seat < Product
  attr_accessible :ball_table_id, :quantity

belongs_to :ball_table
end