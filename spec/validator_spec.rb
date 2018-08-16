require "validator"

describe Validator do

  context "validate cell choice" do
    it "returns true given valid choice" do
      grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      validator = Validator.new(board)
      expect(validator.valid_cell?(1)).to be true
    end
  end
end
