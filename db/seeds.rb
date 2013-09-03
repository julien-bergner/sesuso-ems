# First floor
t1 = BallTable.create!( :caption => "Tisch 1", :floor => "1", :table_type => "rect", :price => "0", :position_x => "310", :position_y => "135", :radius => "0", :width => "75", :height => "50")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 4, :ball_table_id => t1.id)

t2 = BallTable.create!( :caption => "Tisch 2", :floor => "1", :table_type => "rect", :price => "0", :position_x => "310", :position_y => "15", :radius => "0", :width => "75", :height => "100")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 8, :ball_table_id => t2.id)

t3 = BallTable.create!( :caption => "Tisch 3", :floor => "1", :table_type => "circle", :price => "0", :position_x => "235", :position_y => "55", :radius => "40", :width => "0", :height => "0")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 10, :ball_table_id => t3.id)

t4 = BallTable.create!( :caption => "Tisch 4", :floor => "1", :table_type => "rect", :price => "0", :position_x => "100", :position_y => "40", :radius => "0", :width => "50", :height => "50")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 4, :ball_table_id => t4.id)

t5 = BallTable.create!( :caption => "Tisch 5", :floor => "1", :table_type => "rect", :price => "0", :position_x => "15", :position_y => "130", :radius => "0", :width => "100", :height => "75")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 8, :ball_table_id => t5.id)

t6 = BallTable.create!( :caption => "Tisch 6", :floor => "1", :table_type => "circle", :price => "0", :position_x => "65", :position_y => "265", :radius => "40", :width => "0", :height => "0")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 10, :ball_table_id => t6.id)

t7 = BallTable.create!( :caption => "Tisch 7", :floor => "1", :table_type => "rect", :price => "0", :position_x => "15", :position_y => "325", :radius => "0", :width => "100", :height => "75")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 8, :ball_table_id => t7.id)

t8 = BallTable.create!( :caption => "Tisch 8", :floor => "1", :table_type => "circle", :price => "0", :position_x => "75", :position_y => "460", :radius => "40", :width => "0", :height => "0")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 10, :ball_table_id => t8.id)

t9 = BallTable.create!( :caption => "Tisch 9", :floor => "1", :table_type => "rect", :price => "0", :position_x => "150", :position_y => "435", :radius => "0", :width => "75", :height => "100")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 8, :ball_table_id => t9.id)

t10 = BallTable.create!( :caption => "Tisch 10", :floor => "1", :table_type => "circle", :price => "0", :position_x => "290", :position_y => "485", :radius => "40", :width => "0", :height => "0")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 10, :ball_table_id => t10.id)

# Second floor
t11 = BallTable.create!( :caption => "Tisch 11", :floor => "2", :table_type => "circle", :price => "0", :position_x => "315", :position_y => "55", :radius => "40", :width => "0", :height => "0")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 10, :ball_table_id => t11.id)

t12 = BallTable.create!( :caption => "Tisch 12", :floor => "2", :table_type => "rect", :price => "0", :position_x => "170", :position_y => "15", :radius => "0", :width => "75", :height => "100")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 8, :ball_table_id => t12.id)

t13 = BallTable.create!( :caption => "Tisch 13", :floor => "2", :table_type => "circle", :price => "0", :position_x => "100", :position_y => "70", :radius => "40", :width => "0", :height => "0")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 10, :ball_table_id => t13.id)

t14 = BallTable.create!( :caption => "Tisch 14", :floor => "2", :table_type => "rect", :price => "0", :position_x => "15", :position_y => "130", :radius => "0", :width => "100", :height => "75")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 8, :ball_table_id => t14.id)

t15 = BallTable.create!( :caption => "Tisch 15", :floor => "2", :table_type => "circle", :price => "0", :position_x => "65", :position_y => "265", :radius => "40", :width => "0", :height => "0")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 10, :ball_table_id => t15.id)

t16 = BallTable.create!( :caption => "Tisch 16", :floor => "2", :table_type => "rect", :price => "0", :position_x => "15", :position_y => "325", :radius => "0", :width => "100", :height => "75")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 8, :ball_table_id => t16.id)

t17 = BallTable.create!( :caption => "Tisch 17", :floor => "2", :table_type => "circle", :price => "0", :position_x => "75", :position_y => "460", :radius => "40", :width => "0", :height => "0")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 10, :ball_table_id => t17.id)

t18 = BallTable.create!( :caption => "Tisch 18", :floor => "2", :table_type => "rect", :price => "0", :position_x => "145", :position_y => "485", :radius => "0", :width => "75", :height => "50")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 4, :ball_table_id => t18.id)

t19 = BallTable.create!( :caption => "Tisch 19", :floor => "2", :table_type => "rect", :price => "0", :position_x => "335", :position_y => "270", :radius => "0", :width => "50", :height => "75")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 4, :ball_table_id => t19.id)

t20 = BallTable.create!( :caption => "Tisch 20", :floor => "2", :table_type => "rect", :price => "0", :position_x => "215", :position_y => "270", :radius => "0", :width => "100", :height => "75")
Seat.create!( :caption => "Karte", :price => "65", :quantity => 8, :ball_table_id => t20.id)
















