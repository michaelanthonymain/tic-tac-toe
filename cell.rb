class Cell
  attr_accessor :state
  attr_reader :location

  def initialize(location)
    @state = ' '
    @location = location
  end
end