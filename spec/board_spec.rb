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

  context " #place_an_x" do
    it "should change the state of a cell to 'X'" do
      cell = board.cells[0]
      expect(cell.state).to eq(' ')
      board.place_an_x(cell)
      expect(cell.state).to eq('X')
    end
  end

  context " #check_rows" do
    pending("yet to implement feature")
  end

  context " #check_columns" do
    pending("yet to implement feature")
  end

  context " #check_diagonals" do
    pending("yet to implement feature")
  end

  context " #place_an_o" do
    pending("yet to implement feature")
  end

end