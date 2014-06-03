class Board
  attr_accessor :cells, :valid_moves
  attr_reader :rows, :columns, :diagonals

  def initialize
    @cells = []
    @rows = []
    @columns = []
    @diagonals = []
    @valid_moves = (0..8).to_a

    build_board
    build_rows
    build_columns
    build_diagonals
  end


  def place_a_marker(cell, x_or_o)
    if valid_moves.include?(cell.location)
      valid_moves.delete_at(cell.location)
      cell.state = x_or_o.to_s
    else
      puts "Invalid move. Valid moves are #{valid_moves.join(', ')}"
    end
  end

  private

  def build_board
    location = 0
    9.times do
      cells << Cell.new(location)
      location += 1
    end
  end

  def build_rows
    row_0 = [@cells[0], @cells[1], @cells[2]]
    row_1 = [@cells[3], @cells[4], @cells[5]]
    row_2 = [@cells[6], @cells[7], @cells[8]]
    @rows << row_0 << row_1 << row_2
  end

  def build_columns
  end

  def build_diagonals
  end

end