class BallTable < ActiveRecord::Base
  attr_accessible :caption, :floor, :height, :position_x, :position_y, :price, :radius, :type, :width
end
