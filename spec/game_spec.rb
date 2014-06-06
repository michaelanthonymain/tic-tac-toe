require 'spec_helper'

describe Game do
let(:game) {Game.new(Board.new)}

  context " #initialize" do
    it "should initialize with a new board that is a Board object" do
      expect(game.board).to be_a Board
    end

    it "should not have a winner" do
      expect(game.winner).to eq('')
    end
  end

end