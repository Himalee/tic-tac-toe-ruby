require "board"

describe Board do
  describe "#tie?()" do
    it "returns false given empty board" do
      grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      expect(board.tie?(grid)).to be false
    end
  end
end
