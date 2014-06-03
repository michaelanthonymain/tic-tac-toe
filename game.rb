require_relative 'board.rb'
require_relative 'cell.rb'
require_relative 'io.rb'

class Game
  attr_reader :board

  def initialize(board)
    @board = board
    choose_order
  end

  def play(order)
    # if order == 1
    #   #place_an_x
    # else 
    #   #place_an_o
    # end

    # check_board
    # break if game_over?
  end

  def choose_order
    puts "Do you want to go first or second? (1, 2)"
    response = gets.chomp
    play(response)
  end
end

# Game.new.run!