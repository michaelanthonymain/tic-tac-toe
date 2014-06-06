require 'spec_helper'

describe Cell do
  let(:cell) {Cell.new(0)}

  context " #initialize" do
    it "should have a state of ' ' " do
      cell.state.should eq(' ')
    end 

    it "should have a location" do
      cell.location.should eq(0)
    end
  end

end