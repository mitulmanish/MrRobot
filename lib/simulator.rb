require_relative '../lib/board'
require_relative "../lib/constant"

class Simulator
# Simulator class is responsible for handling user input
# and ensuring that data integrity is maintained
  include Constant

  attr_accessor :board
  def initialize size
    @board =  Board.new(size)
  end

  def get_user_input
    loop do
      prompt_user
      input  = gets.chomp
      if input.match(/^PLACE/)
        command = split(input)
        coordinate_direction = get_directions(command)
        if check_validity(command[ZERO],coordinate_direction)
          set_position_direction(coordinate_direction)
          loop do
            input  = gets.chomp
            process_command(input)
          end
        else
          invalid_command
          next
        end
      else
        suggestion
      end
    end
  end

  def check_validity(command,coordinate_direction)
    if !verify_place_command(command)
      return false
    elsif !verify_x_coordinate(coordinate_direction[ZERO])
      return false
    elsif !verify_y_coordinate(coordinate_direction[ONE])
      return false
    elsif !verify_direction(coordinate_direction[TWO])
      return false
    end
    true
  end

  def verify_place_command(command)
    (command == "PLACE")
  end

  def verify_y_coordinate(y_coordinate)
    ((y_coordinate.to_i >= ZERO) && (y_coordinate.to_i < board.size))
  end

  def verify_x_coordinate(x_coordinate)
    ((x_coordinate.to_i >= ZERO) && (x_coordinate.to_i < board.size))
  end

  def verify_direction(direction)
    ((direction == NORTH) || (direction == SOUTH) || (direction == EAST) || (direction == WEST))
  end

  def split(input)
    input.split(" ")
  end

  def get_directions(command)
    command[1].split(",")
  end

  def process_command(input)
    case input
      when MOVE
        board.move
      when RIGHT
        board.right
      when LEFT
        board.left
      when REPORT
        board.report
      when /^PLACE/
        place_robot(input)
      else
        invalid_command
    end
  end

  def place_robot(input)
    command = split(input)
    coordinate_direction = get_directions(command)
    if check_validity(command[0], coordinate_direction)
      set_position_direction(coordinate_direction)
    else
      invalid_command
    end
  end

  def set_position_direction(coordinate_direction)
    board.set_position_direction(coordinate_direction[ZERO].to_i,
                                 coordinate_direction[ONE].to_i,
                                 coordinate_direction[TWO])
  end

  def suggestion
    puts "You must place the robot on the board first".upcase
  end

  def prompt_user
    puts "enter the command".upcase
  end

  def invalid_command
    puts "Not a valid command".upcase
  end

end
