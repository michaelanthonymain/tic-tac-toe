require_relative 'board.rb'
require_relative 'cell.rb'

class Game
  attr_accessor :finished
  attr_reader :board

  def initialize(board)
    @board = board
    @finished = false
    # choose_order
  end

  def play(order)
    if order == 1
      until finished
        get_player_move
        find_cpu_move
      end
    elsif order == 2
      until finished
        find_cpu_move
        get_player_move
      end
    else
      puts "I don't understand. First, or second?"
      choose_order
    end
  end

  def choose_order
    puts "Do you want to go first or second? (1, 2)"
    response = gets.chomp
    play(response.to_i)
  end

  def get_player_move
    display_board
    puts "Place an X.\n Valid moves are #{board.valid_moves.join(', ')}."
    response = gets.chomp
    board.place_a_marker(response, 'X')
  end

  def find_cpu_move
    if board.valid_moves.include?(4)
      board.place_a_marker(4, 'O')
    else
      puts "The CPU doesn't know what to do."
    end
  end

  def display_board
    puts board_as_string
  end

  private

  def check_rows
    board.rows.each do row
      if count_markers(row, 'X') == 2
        place_a_marker(find_empty_cell_in_group(row), 'O')
      end
    end
  end

  def find_empty_cell_in_group(group)
    empty_cell = group.select{|cell| cell.state == ' '}
    empty_cell[0].location
  end

  def count_markers(group, x_or_o)
    group.select{|cell| cell.state =~ /x_or_o/}.count
  end

  def board_as_string
    board.cells.each_slice(3)
               .map { |a, b, c| " #{a.state} | #{b.state} | #{c.state} \n"}
               .join("---|---|---\n")
  end

end

board = Board.new
game = Game.new(board)
