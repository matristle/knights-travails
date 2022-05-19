require_relative 'node'
require_relative 'linked_list'

class Board
  attr_accessor :board_grid
  
  def initialize
    make_grid_with_nodes
    append_adjacent_node_positions
  end

  def make_grid_with_nodes
    @board_grid = Array.new(8) { Array.new(8) }

    8.times do |row_index|
      8.times do |column_index|
        @board_grid[row_index][column_index] = Node.new
      end
    end

    return board_grid
  end


  def append_adjacent_node_positions
    8.times do |row_index|
      8.times do |column_index|
        current_node = board_grid[row_index][column_index]
        
        current_node.adjacent_node_positions << [row_index, column_index + 1] unless column_index + 1 > 7
        current_node.adjacent_node_positions << [row_index, column_index - 1] unless column_index - 1 < 0

        current_node.adjacent_node_positions << [row_index + 1, column_index] unless row_index + 1 > 7
        current_node.adjacent_node_positions << [row_index - 1, column_index] unless row_index - 1 < 0
      end
    end
  end

  def print_board(board_grid)
    8.times do |row_index|
      make_row(board_grid, row_index)
    end
    make_zipping_line
  end
 
  def make_row(board_grid, row_index)
    (8 + 1).times do 
      print '----'
    end
    print "\n"
    print '|'
    (8 + 1).times do |column_index|
      print '   |'
      board_grid[row_index][column_index] = '   |'
    end
    print "\n"
  end

  def make_zipping_line
    (8 + 1).times do 
      print '----'
    end
    print "\n"
  end
end















