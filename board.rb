require_relative 'node'

class Board
  attr_accessor :board_grid
  
  def initialize
    @board_grid = Array.new(8) { Array.new(8) { Node.new } }
    make_chess_coordinates
    append_adjacent_node_positions
  end

  def make_chess_coordinates
    column_letter_array = ('A'..'H').to_a
    row_number_array = (1..8).to_a.reverse

    8.times do |row_index|
      8.times do |column_index|
        current_node = board_grid[row_index][column_index]

        current_node.chess_coordinates = "#{column_letter_array[column_index]}#{row_number_array[row_index]}"
      end
    end


  end

  def append_adjacent_node_positions
    8.times do |row_index|
      8.times do |column_index|
        current_node = board_grid[row_index][column_index]

        current_node.adjacent_node_positions << [row_index - 2, column_index - 1] unless row_index - 2 < 0 || column_index - 1 < 0
        current_node.adjacent_node_positions << [row_index - 2, column_index + 1] unless row_index - 2 < 0 || column_index + 1 > 7

        current_node.adjacent_node_positions << [row_index - 1, column_index - 2] unless row_index - 1 < 0 || column_index - 2 < 0
        current_node.adjacent_node_positions << [row_index - 1, column_index + 2] unless row_index - 1 < 0 || column_index + 2 > 7

        current_node.adjacent_node_positions << [row_index + 1, column_index - 2] unless row_index + 1 > 7 || column_index - 2 < 0
        current_node.adjacent_node_positions << [row_index + 1, column_index + 2] unless row_index + 1 > 7 || column_index + 2 > 7

        current_node.adjacent_node_positions << [row_index + 2, column_index - 1] unless row_index + 2 > 7 || column_index - 1 < 0
        current_node.adjacent_node_positions << [row_index + 2, column_index + 1] unless row_index + 2 > 7 || column_index + 1 > 7
        
        # current_node.adjacent_node_positions << [row_index, column_index + 1] unless column_index + 1 > 7
        # current_node.adjacent_node_positions << [row_index, column_index - 1] unless column_index - 1 < 0

        # current_node.adjacent_node_positions << [row_index + 1, column_index] unless row_index + 1 > 7
        # current_node.adjacent_node_positions << [row_index - 1, column_index] unless row_index - 1 < 0
      end
    end
  end
end











