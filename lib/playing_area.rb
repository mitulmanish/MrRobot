require_relative "../lib/constant"

class PlayingArea
  include Constant
  attr_accessor :grid, :x_coordinate, :y_coordinate

  def initialize (size)
    @grid = Array.new(size) { Array.new(size) }
    @x_coordinate = 0
    @y_coordinate = 0
    populate_board()
  end

  def size
    grid.size
  end

  def increment_y(value=1)
    self.y_coordinate += value  if y_coordinate < upper_limit
  end

  def decrement_y(value =1)
    self.y_coordinate -= value  if y_coordinate > LOWER_LIMIT
  end

  def increment_x(value=1)
    self.x_coordinate += value  if x_coordinate < upper_limit
  end

  def decrement_x(value=1)
    self.x_coordinate -= value if x_coordinate > LOWER_LIMIT
  end

  def check_cell
    true if grid[x_coordinate][y_coordinate].include?ROBOT
    false
  end

  def upper_limit
    size - 1
  end

  def populate_board
    grid.each_index do |outer|
      sub_array = grid[outer]
      sub_array.each_index do |inner|
        grid[outer][inner] = " _ "
      end
    end
  end

  def report
    populate_board
    set_cell
    separator
    grid.each do |row|
      print_row(row)
    end
  end

  def print_row(row)
    puts row_space + row.map { |cell| cell.nil? ? "" : "|"+cell+"|" }.join(" ")
    separator
  end

  def get_cell
    grid[x_coordinate][y_coordinate]
  end

  def set_cell(value = ROBOT)
    grid[x_coordinate][y_coordinate] = value
  end

  def set_x_y_coordinate(x, y)
    self.x_coordinate,self.y_coordinate = x,y
  end

  def destroy_cell
    grid[x_coordinate][y_coordinate] = " _ "
  end

  def indent
    "                "
  end

  def separator
    puts (space) +"------------------------------"
  end

  def space
    row_space
  end

  def report_check(direction)
    puts indent + "Output: "+ [x_coordinate, y_coordinate, direction].join(",")
  end

  def row_space
    "          "
  end
end