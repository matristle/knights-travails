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
      # puts "Queue array: #{queue_array}"
    
      current_node_position_array = queue_array.shift 
      # p "Children of #{current_node_position_array}: #{board.board_grid[current_node_position_array[0]][current_node_position_array[1]].adjacent_node_positions}"
      

      if current_node_position_array == destination_position_array
        # puts '----------------------'
        # parent_node_position_array = board.board_grid[current_node_position_array[0]][current_node_position_array[1]].parent
        # p parent_node_position_array
        # parent_node_position_array = board.board_grid[parent_node_position_array[0]][parent_node_position_array[1]].parent
        # p parent_node_position_array
        # parent_node_position_array = board.board_grid[parent_node_position_array[0]][parent_node_position_array[1]].parent
        # p parent_node_position_array

        
        path_array << destination_position_array
        parent_node_position_array = board.board_grid[current_node_position_array[0]][current_node_position_array[1]].parent 
        path_array << parent_node_position_array unless board.board_grid[current_node_position_array[0]][current_node_position_array[1]].parent.nil?
        
        until parent_node_position_array == initial_position_array || parent_node_position_array.nil?
          parent_node_position_array = board.board_grid[parent_node_position_array[0]][parent_node_position_array[1]].parent
          path_array << parent_node_position_array
          break if board.board_grid[parent_node_position_array[0]][parent_node_position_array[1]].parent.nil?
          # p parent_node_position_array
        end
       
        # puts '----------------------'
        return "You made it in #{path_array.length - 1} moves!  Here's your path: #{path_array.reverse}"
      end

      # p current_node_position_array
      
      board.board_grid[current_node_position_array[0]][current_node_position_array[1]].adjacent_node_positions.each do |adjacent_node_position_array|
        queue_array << adjacent_node_position_array
        next if adjacent_node_position_array == board.board_grid[current_node_position_array[0]][current_node_position_array[1]].parent
        board.board_grid[adjacent_node_position_array[0]][adjacent_node_position_array[1]].parent = current_node_position_array
      end
    end
  end
end