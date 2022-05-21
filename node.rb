require_relative 'board'

class Node
  attr_accessor :adjacent_node_positions, :parent, :chess_coordinates

  def initialize
    @adjacent_node_positions = []
    @parent = nil
    @chess_coordinates = nil
  end
end