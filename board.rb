class Board
  attr_accessor :cells, :valid_moves
  attr_reader :groups, :opposite_corners

  def initialize
    @cells = []
    @groups = []
    @opposite_corners = []
    @valid_moves = (0..8).to_a

    build_board
    build_groups
    build_opposite_corners
  end

  def check_groups_for_moves(x_or_o, return_value)
    if return_value == "location"
      groups.each do |subset|
        if count_markers(subset, x_or_o) == 2 && empty_cell_in_group?(subset)
          return find_empty_cell_in_group(subset)
        end
      end
    elsif return_value == "boolean"
      groups.each do |subset|
        return true if count_markers(subset, x_or_o) == 2 && empty_cell_in_group?(subset)
      end
    end
  end

  def check_groups_for_winner
    groups.each do |subset|
      if count_markers(subset, 'X') == 3  
        return 'X' 
      elsif count_markers(subset, 'O') == 3
        return 'O'
      end
    end
  end

  def check_opposite_corners
    opposite_corners.each do |subset|
      return true if count_markers(subset, 'X') == 2
    end
  end

  def display_board
    puts board_as_string
  end

  def display_valid_moves
    puts "Valid moves are: #{valid_moves.join(', ')}."
  end

 def place_a_marker(cell_index, x_or_o)
    cell_to_mark = @cells[cell_index.to_i]
    valid_moves.delete_if{|move| move == cell_to_mark.location}
    cell_to_mark.state = x_or_o.to_s
  end

  def show_valid_moves
    valid_moves
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

  def build_opposite_corners
    opposite_corners_0 = [@cells[0], @cells[8]]
    opposite_corners_1 = [@cells[2], @cells[6]]
    @opposite_corners << opposite_corners_0 << opposite_corners_1
  end

  def board_as_string
    cells.each_slice(3)
         .map { |a, b, c| " #{a.state} | #{b.state} | #{c.state} \n"}
         .join("---|---|---\n")
  end

  def count_markers(group, x_or_o)
    group.select{|cell| cell.state == x_or_o}.count
  end

  def empty_cell_in_group?(group)
    empty_cell = group.select{|cell| cell.state == ' '}
    return true if empty_cell[0]
  end

  def find_empty_cell_in_group(group)
    empty_cell = group.select{|cell| cell.state == ' '}
    empty_cell[0].location
  end
end