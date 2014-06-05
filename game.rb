require_relative 'board.rb'
require_relative 'cell.rb'

class Game
  attr_accessor :finished, :winner
  attr_reader :board

  def initialize(board)
    @board = board
    @finished = false
    @winner = ''
    choose_order
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
    end
  end

  def choose_order
    puts "Do you want to go first or second? (1, 2)"
    response = gets.chomp
    if response == '1' || response == '2'
      play(response.to_i)
    else
      puts "I don't understand. First, or second? (1, 2)"
      choose_order
    end
  end

  def get_player_move
    board.display_board
    puts "Place an X.\n Valid moves are #{board.valid_moves.join(', ')}."
    response = gets.chomp
    if valid_move?(response.to_i)
      board.place_a_marker(response, 'X')
    else
      puts "Invalid move. Valid moves are #{board.valid_moves.join(', ')}."
      get_player_move
    end
  end

  private

  def find_cpu_move
    if early_game?
      early_game_cpu_move
    elsif can_win?
      attacking_move
    elsif must_block?
      defensive_move
    end
  end

  def early_game?
    board.valid_moves.count >= 7
  end

  def early_game_cpu_move
    if valid_move?(4)
      take_the_middle
    else 
      take_a_corner
    end
  end

  def can_win?
    board.check_groups('O')
  end

  def attacking_move
    
  end

  def must_block?
    board.check_groups('X')
  end

  def take_the_middle
    board.place_a_marker(4, 'O')
  end

  def take_a_corner
    corners = [0, 2, 6, 8]
    corners.each do |index|
      if valid_move?(index)
        board.place_a_marker(index, 'O')
        break
      end
    end
  end

  def valid_move?(cell_index)
    board.valid_moves.include?(cell_index)
  end

end

board = Board.new
game = Game.new(board)
