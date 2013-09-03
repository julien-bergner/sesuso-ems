class Seat < Product
  attr_accessible :ball_table_id, :quantity

 has_one :ball_table
end