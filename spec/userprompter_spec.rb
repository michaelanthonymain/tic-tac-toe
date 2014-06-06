require 'spec_helper'
require 'stringio'

describe UserPrompter do

=begin
Still looking to test UserPrompter methods.
All Reader and Writer specs pass, need to verify that UP methods wire
them together (need to learn how to mock full classes in RSpec) similar
to the MiniTest example in Testing Code That's Hard to Test blog post.
=end

#Reader Specs
  context " Reader::read_order" do
    it "should return the input" do
      input_stream = StringIO.new('1')
      expect(UserPrompter::Reader.read_order(input_stream)).to eq('1')
    end
  end

  context " Reader::read_move" do
    it "should return the input" do
      input_stream = StringIO.new('8')
      expect(UserPrompter::Reader.read_move(input_stream)).to eq('8')
    end
  end

#Writer Specs
  context " Writer::ask_for_order" do
    it "should ask for an order" do
      output_stream = StringIO.new
      UserPrompter::Writer.ask_for_order(output_stream)
      output_stream.rewind
      expect(output_stream.read.empty?).to eq(false)
    end
  end

  context " Writer::ask_for_move" do
    it "should ask for an order" do
      output_stream = StringIO.new
      UserPrompter::Writer.ask_for_move(output_stream)
      output_stream.rewind
      expect(output_stream.read.empty?).to eq(false)
    end
  end

  context " Writer::notify_invalid" do
    it "should ask for an order" do
      output_stream = StringIO.new
      UserPrompter::Writer.notify_invalid(output_stream)
      output_stream.rewind
      expect(output_stream.read.empty?).to eq(false)
    end
  end

  context " Writer::show_draw_outcome" do
    it "should ask for an order" do
      output_stream = StringIO.new
      UserPrompter::Writer.show_draw_outcome(output_stream)
      output_stream.rewind
      expect(output_stream.read.empty?).to eq(false)
    end
  end

  context " Writer::show_winner_outcome" do
    it "should ask for an order" do
      output_stream = StringIO.new
      UserPrompter::Writer.show_winner_outcome(output_stream, 'O')
      output_stream.rewind
      expect(output_stream.read.empty?).to eq(false)
    end
  end
end
  