require 'spec_helper'

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

  context " #build_rows" do
    it "should make @rows a nested array" do
      expect(board.rows.count).to eq(3)
      expect(board.rows[0].count).to eq(3) 
    end
  end

  context " #build_columns" do
    it "should make @columns a nested array" do
      expect(board.columns.count).to eq(3)
      expect(board.columns[0].count).to eq(3)
    end
  end

  context " #build_diagonals" do
    it "should make @diagonals a nested array" do
      expect(board.diagonals.count).to eq(2)
      expect(board.diagonals[0].count).to eq(3)
    end
  end

end