require_relative 'board.rb'
require_relative 'cell.rb'

class Game
  attr_accessor :winner
  attr_reader :board

  def initialize(board)
    @board = board
    @winner = ''
    choose_order
  end

  private

  def play(order)
    if order == 1
      until finished?
        get_player_move
        find_cpu_move
      end
    elsif order == 2
      until finished?
        find_cpu_move
        get_player_move
      end
    end
    display_winner
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
    puts "Place an X.\n Valid moves are #{board.show_valid_moves.join(', ')}."
    response = gets.chomp
    if valid_move?(response.to_i)
      board.place_a_marker(response, 'X')
    else
      puts "Invalid move. Valid moves are #{board.show_valid_moves.join(', ')}."
      get_player_move
    end
  end

  def find_cpu_move
    if early_game?
      early_game_cpu_move
    elsif check_to_win_or_block?('O')
      win_or_block('O')
    elsif check_to_win_or_block?('X')
      win_or_block('X')
    elsif opponent_has_opposite_corners
      take_a_side
    else
      take_a_corner
    end
  end

  def valid_move?(cell_index)
    board.show_valid_moves.include?(cell_index)
  end

  def early_game?
    board.show_valid_moves.count >= 7
  end

  def early_game_cpu_move
    if valid_move?(4)
      take_the_middle
    else 
      take_a_corner
    end
  end

  def check_to_win_or_block?(marker_to_check)
    board.check_groups_for_moves(marker_to_check, "boolean") == true
  end

  def win_or_block(marker_to_check)
    board.place_a_marker(board.check_groups_for_moves(marker_to_check, "location"), 'O')
  end

  def opponent_has_opposite_corners
    board.check_opposite_corners == true
  end

  def take_the_middle
    board.place_a_marker(4, 'O')
  end

  def take_a_corner
    corners = [0, 2, 6, 8]
    corners.each do |corner|
      if valid_move?(corner)
        board.place_a_marker(corner, 'O')
        break
      end
    end
  end

  def take_a_side
    sides = [1, 3, 5, 7]
    sides.each do |side|
      if valid_move?(side)
        board.place_a_marker(side, 'O')
        break
      end
    end
  end

  def finished?
    if board.show_valid_moves.empty?
      true
    elsif is_there_a_winner?
      true
    else
      false
    end
  end

  def is_there_a_winner?
    if board.check_groups_for_winner == 'X'
      @winner = 'X'
      return true
    elsif board.check_groups_for_winner == 'O'
      @winner = 'O'
      return true
    end
  end

  def display_winner
    board.display_board
    if winner == 'X' || winner == 'O'
      puts "The winner is #{@winner}!\nThanks for playing!"
      exit
    else
      puts "Looks like the game was a draw. Thanks for playing!"
      exit
    end
  end

end

board = Board.new
game = Game.new(board)
