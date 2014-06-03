require_relative 'board.rb'
require_relative 'cell.rb'

class Game
  attr_accessor :finished?
  attr_reader :board

  def initialize(board)
    @board = board
    @finished = false
    choose_order
  end

  def play(order)
    # if order == 1
        #until game.finished?
          #get_player_move
          #place_a_marker
          #find_cpu_move
          #place_a_marker
        #end
    # else 
        #until game.finished?
          #find_cpu_move
          #place_a_marker
          #get_player_move
          #place_a_marker
        #end
    # end
  end

  def choose_order
    puts "Do you want to go first or second? (1, 2)"
    response = gets.chomp
    play(response)
  end

  def display_board
  end

  def check_rows
    @rows.each do row
      if row.select{|cell| cell.state =~ /\s/}.count == 1
        board.place_a_marker(cell, "O")
      end
    end
  end

end

# Game.new.run!