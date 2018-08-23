require "validator"

describe Validator do

  context "validate cell choice" do
    before :each do
      @validator = Validator.new
    end

    it "returns true given valid choice" do
      grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      expect(@validator.available_cell?(board, 1, "O", "X")).to be true
    end

    it "returns false given invalid choice" do
      grid = ["X", 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      expect(@validator.available_cell?(board, 0, "O", "X")).to be false
    end
  end
end
