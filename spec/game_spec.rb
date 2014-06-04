require 'spec_helper'

describe Game do
let(:game) {Game.new(Board.new)}

  context " #initialize" do
    it "should initialize with a new board that is a Board object" do
      expect(game.board).to be_a Board
    end

    it "should not be finished" do
      expect(game.finished).to eq(false)
    end
  end

  context " #choose_order" do
    it "should set the order of moves" do
      game.stub(:gets).and_return("1")
      game.choose_order
      expect(game.finished).to eq(false)
      game.finished = true
    end
  end

  context " #get_player_move" do
    it "should place a marker at the desired location" do
      game.stub(:gets).and_return("1")
      game.get_player_move
      expect(game.board.cells[1].state).to eq('X')
    end
  end

end