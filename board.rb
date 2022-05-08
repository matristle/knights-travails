class Board
  attr_accessor :board_nested_arrays
  def initialize
    @board_nested_arrays = Array.new(8) { Array.new(8, '') }
    8.times do |row_index|
      make_row(@board_nested_arrays, row_index)
    end
    make_zipping_line

    pp @board_nested_arrays
  end

  def make_row(board_nested_arrays, row_index)
    (8 + 1).times do 
      print '----'
    end
    print "\n"
    print '|'
    (8 + 1).times do |column_index|
      print '   |'
      board_nested_arrays[row_index][column_index] = '   |'
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

board = Board.new











