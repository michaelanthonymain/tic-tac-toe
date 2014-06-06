require 'spec_helper'

=begin
public methods to test: check_groups_for_moves, check_groups_for_winner,
check_opposite_corners. Would like to test return values here, but
tests have been getting the nested arrays only -- not the actual return
values.
=end

describe Board do
  let(:board) { Board.new }

  context " #initialize" do
    it "should have nine spaces" do
      expect(board.cells.count).to eq(9)
    end

    it "should have 9 valid moves" do
      expect(board.valid_moves.count).to eq(9)
    end
  end

  context " #build_board" do
    it "should create a board filled with cells" do
      expect(board.cells[0]).to be_a Cell
    end

    it "should create cells with locations equal to their array index" do
      expect(board.cells[4].location).to eq(4)
    end
   end

  context " #build_group" do
    it "should create a groups nested array with 8 groups" do
      expect(board.groups.count).to eq(8)
    end

    it "should have 3 cells in each group" do
      expect(board.groups[3].count).to eq(3)
    end
  end

  context " #build_opposite_corners" do
    it "should create an opposite_corners nested array with 2 groups" do
      expect(board.opposite_corners.count).to eq(2)
    end

    it "should have 2 cells in each group" do
      expect(board.opposite_corners.count).to eq(2)
    end
  end

  context " #place_a_marker" do
    it "should change the state of a cell" do
      cell = board.cells[0]
      expect(cell.state).to eq(' ')
      board.place_a_marker(0, 'X')
      expect(cell.state).to eq('X')
    end

    it "should delete the move from valid moves" do
      board.place_a_marker(0, 'X')
      expect(board.valid_moves.include?(0)).to eq(false)
    end
  end

end