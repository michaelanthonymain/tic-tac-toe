require 'spec_helper'

describe Cell do
  let(:cell) {Cell.new(0)}

  context " #initialize" do
    it "should have a state of ' ' " do
      cell.state.should eq(' ')
    end 
  end

end