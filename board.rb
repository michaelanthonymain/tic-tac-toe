class Board
  attr_accessor :cells, :valid_moves

  def initialize
    @cells = []
    @valid_moves = (0..8).to_a
    build_board
  end

  def build_board
    location = 0
    9.times do
      cells << Cell.new(location)
      location += 1
    end
  end

  def place_an_x(cell)
    valid_moves.delete_at(cell.location)
    cell.state = 'X'
  end


end