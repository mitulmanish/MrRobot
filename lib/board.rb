require_relative "../lib/constant"
require_relative "../lib/playing_area"

class Board
# Board class is responsible for handling the movement
# of robot on the table/board.
  include Constant

  attr_reader :size
  attr_accessor :direction, :matrix

  def initialize (size)
    @x_coordinate = ZERO
    @y_coordinate = ZERO
    @direction = NORTH
    @matrix = PlayingArea.new(size)
  end

  def move(value=1)
    destroy_cell
    case direction
      when EAST
        move_east(value)
      when WEST
        move_west(value)
      when SOUTH
        move_south(value)
      when NORTH
        move_north(value)
    end
  end

  def right
    case direction
      when EAST
        self.direction = SOUTH
      when WEST
        self.direction = NORTH
      when SOUTH
        self.direction = WEST
      when NORTH
        self.direction = EAST
      else
        self.direction = NORTH
    end
  end

  def left
    case direction
      when EAST
        self.direction = NORTH
      when WEST
        self.direction = SOUTH
      when SOUTH
        self.direction = EAST
      when NORTH
        self.direction = WEST
      else
        self.direction = NORTH
    end
  end

  def set_position_direction (x,y,direction)
    matrix.set_x_y_coordinate(x,y)
    self.direction = direction
  end

  def report
    matrix.report_check(direction)
    matrix.report
  end


  def move_east(value = 1)
    matrix.increment_x(value)
  end

  def move_west(value = 1)
    matrix.decrement_x(value)
  end

  def move_north(value = 1)
    matrix.increment_y(value)
  end

  def move_south(value = 1)
    matrix.decrement_y(value)
  end

  def get_cell
    matrix.get_cell
  end

  def set_cell
    matrix.set_cell
  end

  def destroy_cell
    matrix.destroy_cell
  end

  def set_direction (direction)
    self.direction = direction
  end

  def check_cell
    matrix.check_cell
  end

  def size
    matrix.size
  end
end
