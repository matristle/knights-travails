require_relative 'board'

class Node
  attr_accessor :adjacent_node_positions

  def initialize
    @adjacent_node_positions = []
  end
end