require_relative 'board'
require_relative 'node'

class Knight
  def initialize
      # @marker = 'N'
  end

  def knight_moves(initial_position_array, destination_position_array)
    board = Board.new

    queue_array = []
    path_array = []

    queue_array << initial_position_array

    until queue_array.empty?
      current_node_position_array = queue_array.shift 

      if current_node_position_array == destination_position_array
        path_array << destination_position_array
        parent_node_position_array = board.board_grid[current_node_position_array[0]][current_node_position_array[1]].parent 
        path_array << parent_node_position_array unless board.board_grid[current_node_position_array[0]][current_node_position_array[1]].parent.nil?
        
        until parent_node_position_array == initial_position_array || parent_node_position_array.nil?
          parent_node_position_array = board.board_grid[parent_node_position_array[0]][parent_node_position_array[1]].parent
          path_array << parent_node_position_array
          break if board.board_grid[parent_node_position_array[0]][parent_node_position_array[1]].parent.nil?
        end

        chess_coordinates_path_array = []
        path_array.reverse!.each do |path_coordinates|
          chess_coordinates_path_array << board.board_grid[path_coordinates[0]][path_coordinates[1]].chess_coordinates
        end
       
        puts "#{path_array.length - 1} moves from #{chess_coordinates_path_array.first} to #{chess_coordinates_path_array.last}..."
        puts "Here's your path: "
        chess_coordinates_path_array.each_with_index do |coordinate, number_of_spaces|
          puts coordinate
          (number_of_spaces + 1).times { print "\t" }
        end

        break
      end

      board.board_grid[current_node_position_array[0]][current_node_position_array[1]].adjacent_node_positions.each do |adjacent_node_position_array|
        queue_array << adjacent_node_position_array
        next if adjacent_node_position_array == board.board_grid[current_node_position_array[0]][current_node_position_array[1]].parent
        board.board_grid[adjacent_node_position_array[0]][adjacent_node_position_array[1]].parent = current_node_position_array
      end
    end
  end
end