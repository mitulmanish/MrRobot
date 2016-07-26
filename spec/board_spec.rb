require 'board'

describe 'Board' do

  context 'allows for verifying the default values' do
    it 'allows for checking the default value of :direction' do
      board = Board.new(5)
      expect(board.direction).to eq('NORTH')
    end
  end

  context "attributes" do
    before (:each) do
       @board = Board.new(5)
    end

    it "allows for reading and writing for direction" do
      @board.direction = 'EAST'
      expect(@board.direction).to eq('EAST')
    end

    it "allows for reading of grid size" do
      expect(@board.size).to eq(5)
    end

  end

  context ".right" do

    before (:each) do
      @board = Board.new(5)
    end

    it "allows for checking the direction of robot which is facing north when it is turned right" do
      @board.direction = "NORTH"
      @board.right
      expect(@board.direction).to eq("EAST")
    end

    it "allows for checking the direction of robot which is facing south when it is turned right" do
      @board.direction = "SOUTH"
      @board.right
      expect(@board.direction).to eq("WEST")
    end

    it "allows for checking the direction of robot which is  facing  east it is turned right" do
      @board.direction = "EAST"
      @board.right
      expect(@board.direction).to eq("SOUTH")
    end

    it "allows for checking the direction of robot which is facing west when it is turned right" do
      @board.direction = "WEST"
      @board.right
      expect(@board.direction).to eq("NORTH")
    end
  end

  context ".left" do

    before (:each) do
      @board = Board.new(5)
    end

    it "allows for checking the direction of robot which is facing north when it is turned left" do
      @board.direction = "NORTH"
      @board.left
      expect(@board.direction).to eq("WEST")
    end

    it "allows for checking the direction of robot which is facing south when it is turned left" do
      @board.direction = "SOUTH"
      @board.left
      expect(@board.direction).to eq("EAST")
    end

    it "allows for checking the direction of robot which is facing east when it is turned left" do
      @board.direction = "EAST"
      @board.left
      expect(@board.direction).to eq("NORTH")
    end

    it "allows for checking the direction of robot which is facing west when it is turned left" do
      @board.direction = "WEST"
      @board.left
      expect(@board.direction).to eq("SOUTH")
    end
  end
end
