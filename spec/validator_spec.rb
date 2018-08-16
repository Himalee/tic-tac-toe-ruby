require "validator"

describe Validator do

  context "validate cell choice" do
    it "returns true given valid choice" do
      grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      validator = Validator.new
      expect(validator.valid_cell?(board, 1)).to be true
    end

    it "returns false given invalid choice" do
      grid = ["X", 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      validator = Validator.new
      expect(validator.valid_cell?(board, 0)).to be false
    end
  end
end
