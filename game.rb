require_relative 'board.rb'
require_relative 'cell.rb'

class Game
  attr_accessor :finished
  attr_reader :board

  def initialize(board)
    @board = board
    @finished = false
  end

  def play(order)
    if order == 1
      until finished
        get_player_move
        find_cpu_move
      end
    else 
      until finished
        find_cpu_move
        get_player_move
      end
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
      board.place_a_marker(4, "0")
    else
      puts "The CPU doesn't know what to do."
    end
  end

  def display_board
    puts board_as_string
  end

  private

  def check_rows
    @rows.each do row
      if row.select{|cell| cell.state =~ /\s/}.count == 1
        board.place_a_marker(cell, "O")
      end
    end
  end

  def board_as_string
    board.cells.each_slice(3)
               .map { |a, b, c| " #{a.state} | #{b.state} | #{c.state} \n"}
               .join("---|---|---\n")
  end

end

board = Board.new
game = Game.new(board)
game.choose_order