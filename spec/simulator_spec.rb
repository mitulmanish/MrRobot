require 'simulator'

describe 'Simulator' do

  before (:each) do
   @simulator = Simulator.new(5)
  end

  it 'allows for checking that board has been initialised correctly' do
    expect(@simulator.board).to be_a Board
  end

  it 'allows for checking that board size is set up correctly' do
    expect(@simulator.board.size).to eq(5)
  end

  it 'allows for checking that valid value of y coordinate is accepted as input' do
    expect(@simulator.verify_y_coordinate(4)).to be true
  end

  it 'allows for checking that values exceeding the size of board are not accepted as input' do
    expect(@simulator.verify_y_coordinate(5)).to be false
  end

  it 'allows for checking that valid values of x coordinate is accepted as input' do
    simulator = Simulator.new(5)
    expect(simulator.verify_x_coordinate(2)).to be true
  end

  it 'allows for checking that negative x coordinate values are not accepted as input' do
    expect(@simulator.verify_x_coordinate(-1)).to be false
  end

  it 'allows for checking that correct direction parameter is accepted as input' do
    expect(@simulator.verify_direction("EAST")).to be true
  end

  it 'allows for checking that only valid direction parameters are accepted as input' do
    expect(@simulator.verify_direction("XYZ")).to be false
  end

end
