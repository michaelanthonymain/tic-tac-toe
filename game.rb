require_relative 'board.rb'
require_relative 'cell.rb'

class Game
  attr_reader :board

  def initialize(board)
    @board = board
    choose_order
  end

  def play(order)
    # if order == 1
        #until game.over?
          #get_player_move
          #place_a_marker
          #find_cpu_move
          #place_a_marker
        #end
    # else 
        #until game.over?
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

  def check_rows
    @rows.each do row
      if row.select{|cell| cell.state =~ /\s/}.count == 1
        place_a_marker(cell.location, "O")
      end

    end
  end
end

# Game.new.run!