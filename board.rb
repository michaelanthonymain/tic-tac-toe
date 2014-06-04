class Board
  attr_accessor :cells, :valid_moves
  attr_reader :groups

  def initialize
    @cells = []
    @groups = []
    @valid_moves = (0..8).to_a

    build_board
    build_groups
  end

  def place_a_marker(cell_index, x_or_o)
    cell_to_mark = @cells[cell_index.to_i]
    valid_moves.delete_if{|move| move == cell_to_mark.location}
    cell_to_mark.state = x_or_o.to_s
  end

  def check_groups(x_or_o)
    groups.each do |subset|
      if count_markers(subset, x_or_o) == 2 && empty_cell_in_group?(subset)
        place_a_marker(find_empty_cell_in_group(subset), 'O')
      end
    end
  end

  def display_board
    puts board_as_string
  end

  private

  def build_board
    location = 0
    9.times do
      cells << Cell.new(location)
      location += 1
    end
  end

  def build_groups
    row_0 = [@cells[0], @cells[1], @cells[2]]
    row_1 = [@cells[3], @cells[4], @cells[5]]
    row_2 = [@cells[6], @cells[7], @cells[8]]
    col_0 = [@cells[0], @cells[3], @cells[6]]
    col_1 = [@cells[1], @cells[4], @cells[7]]
    col_2 = [@cells[2], @cells[5], @cells[8]]
    diagonal_0 = [@cells[0], @cells[4], @cells[8]]
    diagonal_1 = [@cells[6], @cells[4], @cells[2]]
    @groups << row_0 << row_1 << row_2 << col_0 << col_1 << col_2 << diagonal_0 << diagonal_1
  end

  def count_markers(subset, x_or_o)
    subset.select{|cell| cell.state == x_or_o}.count
  end

  def empty_cell_in_group?(group)
    empty_cell = group.select{|cell| cell.state == ' '}
    return true if empty_cell[0]
  end

  def find_empty_cell_in_group(group)
    empty_cell = group.select{|cell| cell.state == ' '}
    empty_cell[0].location
  end

  def board_as_string
    cells.each_slice(3)
         .map { |a, b, c| " #{a.state} | #{b.state} | #{c.state} \n"}
         .join("---|---|---\n")
  end
end