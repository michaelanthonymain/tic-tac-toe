require_relative 'board.rb'

class UserPrompter
  def self.choose_order(reader=Reader, writer=Writer)
    writer.ask_for_order
    order = reader.read_order
    if order
      Game::set_user_response(order)
    else
      writer.notify_invalid
      self.choose_order(reader, writer)
    end
  end

  # def self.get_player_move
  #   board.display_board
  #   puts "Place an X.\n Valid moves are #{board.show_valid_moves.join(', ')}."
  #   get_input
  #   Game::set_user_response(input)
  # end

  # def self.get_player_move_invalid
  #   puts "Invalid move. Valid moves are #{board.show_valid_moves.join(', ')}."
  #   get_input
  #   Game::set_user_response(input)
  # end

  # def self.display_winner(winner_or_draw)
  #   if winner_or_draw == 'winner'
  #     puts "The winner is #{game.winner}!\nThanks for playing!"
  #   else
  #     puts "Looks like the game was a draw. Thanks for playing!"
  #   end
  #   exit
  # end
end

class Writer
  def self.ask_for_order(output_stream=$stdout)
    output_stream.print "Do you want to go first or second? (1, 2)"
  end

  def self.notify_invalid(output_stream=$stdout)
    output_stream.puts "That's not a valid response."
  end
end

class Reader
  def self.read_order(input_stream=$stdin)
    input = input_stream.gets.chomp
    return true if input == '1' || input == '2'
  end
end