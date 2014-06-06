require_relative 'board.rb'
require_relative 'cell.rb'
require_relative 'userprompter.rb'

class Game
  attr_accessor :winner
  attr_reader :board

  def initialize(board)
    @board = board
    @winner = nil
  end

  def set_order(input)
    play(input)
  end

  private

  def play(order)
    if order == '1'
      until finished?
        find_player_move
        find_cpu_move
      end
    elsif order == '2'
      until finished?
        find_cpu_move
        next if is_there_a_winner?
        find_player_move
      end
    end
    determine_winner
  end

  def find_player_move
    board.display_board
    board.display_valid_moves
    set_player_move(UserPrompter::get_player_move)
  end

  def set_player_move(input)
    if valid_move?(input.to_i)
      board.place_a_marker(input.to_i, 'X')
    else
      set_player_move(UserPrompter::get_player_move_invalid)
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

  def determine_winner
    board.display_board
    if winner == 'X' || winner == 'O'
      UserPrompter::display_winner("#{winner}")
    else
      UserPrompter::display_winner('draw')
    end
  end

end

board = Board.new
game = Game.new(board)
game.set_order(UserPrompter::choose_order)
