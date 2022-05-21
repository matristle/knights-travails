require_relative 'node'
require_relative 'linked_list'

class Board
  attr_accessor :board_grid
  
  def initialize
    @board_grid = Array.new(8) { Array.new(8) { Node.new } }
    append_adjacent_node_positions
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











