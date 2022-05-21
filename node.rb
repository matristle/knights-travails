require_relative 'board'

class Node
  attr_accessor :adjacent_node_positions, :parent

  def initialize
    @adjacent_node_positions = []
    @parent = nil
  end
end