class BallTable < ActiveRecord::Base
  attr_accessible :id, :caption, :floor, :height, :position_x, :position_y, :price, :radius, :table_type, :width

  has_many :seats
end
