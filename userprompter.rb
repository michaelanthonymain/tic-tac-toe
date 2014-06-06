require_relative 'board.rb'

class UserPrompter
  def self.choose_order(reader=Reader, writer=Writer)
    writer.ask_for_order
    order = reader.read_order
    return order if order == '1' || order == '2'
    writer.notify_invalid
    self.choose_order(reader, writer)
  end

  def self.get_player_move(reader=Reader, writer=Writer)
    writer.ask_for_move
    move = reader.read_move
    return move
  end

  def self.display_winner(reader=Reader, writer=Writer, winner_or_draw)
    if winner_or_draw == 'draw'
      writer.show_draw_outcome 
    else
      writer.show_winner_outcome(winner_or_draw)
    end
    exit
  end
end

class Writer
  def self.ask_for_order(output_stream=$stdout)
    output_stream.puts "Do you want to go first or second? (1, 2)"
  end

  def self.ask_for_move(output_stream=$stdout)
    output_stream.puts "Place an X by typing the number of the space you want."
  end

  def self.notify_invalid(output_stream=$stdout)
    output_stream.puts "That's not a valid response."
  end

  def self.show_draw_outcome(output_stream=$stdout)
    output_stream.puts "Looks like the game was a draw. Thanks for playing!"
  end

  def self.show_winner_outcome(output_stream=$stdout, winner)
    output_stream.puts "The winner is #{winner}! Thanks for playing!"
  end
end

class Reader
  def self.read_order(input_stream=$stdin)
    input = input_stream.gets.chomp
  end

  def self.read_move(input_stream=$stdin)
    input = input_stream.gets.chomp
  end
end