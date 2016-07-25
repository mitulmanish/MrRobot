require 'playing_area'

describe 'PlayingArea' do

  before(:each) do
    @matrix  = PlayingArea.new(5)
  end

  it "allows for checking that x coordinate has been set up with default value of zero" do
    expect(@matrix.x_coordinate).to eq(0)
  end

  it "allows for checking that y coordinate has been set up with the default value of zero" do
    expect(@matrix.y_coordinate).to eq(0)
  end

  it "allows for checking that grid has been set up correctly" do
    expect(@matrix.grid).to be_instance_of(Array)
  end

  it "allows for checking that the grid has been set up correct size" do
    expect(@matrix.grid.size).to eq(5)
  end

  it "allows for checking that grid has been populated correctly" do
    expect(@matrix.grid[0][0]).to eq(" _ ")
  end

  it "allows for checking that cells of the grid are being set properly" do
    @matrix.set_x_y_coordinate(3,4)
    @matrix.set_cell
    expect(@matrix.grid[3][4]).to eq(" R ")
  end

  it "allows for checking that x coordinate is incremented correctly" do
    @matrix.x_coordinate = 1
    @matrix.increment_x
    expect(@matrix.x_coordinate).to eq(2)
  end

  it "allows for checking that x coordinate is not incremented beyond upper limit " do
    @matrix.set_x_y_coordinate(4,4)
    @matrix.increment_x
    expect(@matrix.x_coordinate).to eq(4)
  end

  it "allows for checking that x coordinate is decremented correctly" do
    matrix = PlayingArea.new(5)
    matrix.set_x_y_coordinate(4,4)
    matrix.decrement_x
    expect(matrix.x_coordinate).to eq(3)
  end

  it "allows for checking that x coordinate is not decremented beyond the lower limit" do
    @matrix.set_x_y_coordinate(0,4)
    @matrix.decrement_x
    expect(@matrix.x_coordinate).to eq(0)
  end

  it "allows for checking that y coordinate is incremented correctly" do
    @matrix.y_coordinate = 2
    @matrix.increment_y
    expect(@matrix.y_coordinate).to eq(3)
  end

  it "allows for checking that increment y function increases the y coordinate correctly" do
    matrix = PlayingArea.new(5)
    matrix.y_coordinate = 0
    matrix.increment_y(3)
    expect(matrix.y_coordinate).to eq(3)
  end

  it "allows for checking that y coordinate is not incremented beyond upper limit " do
    @matrix.set_x_y_coordinate(4,4)
    @matrix.increment_y
    expect(@matrix.y_coordinate).to eq(4)
  end

  it "allows for checking that y coordinate is decremented correctly" do
    @matrix.set_x_y_coordinate(4,4)
    @matrix.decrement_y
    expect(@matrix.y_coordinate).to eq(3)
  end

  it "allows for checking that y coordinate is not decremented beyond the lower limit" do
    @matrix.set_x_y_coordinate(4,0)
    @matrix.decrement_y
    expect(@matrix.y_coordinate).to eq(0)
  end
end