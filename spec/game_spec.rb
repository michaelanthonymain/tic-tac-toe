require 'spec_helper'

=begin
Only public method left to test is set_order, which just calls
another method based on input. Not sure how to write a test for that (you
probably would just test #play instead.) Testing private methods?
=end

describe Game do
let(:game) {Game.new(Board.new)}

  context " #initialize" do
    it "should initialize with a new board that is a Board object" do
      expect(game.board).to be_a Board
    end

    it "should not have a winner" do
      expect(game.winner).to eq(nil)
    end
  end

end