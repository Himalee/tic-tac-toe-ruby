require "board"

describe Board do
  describe "#tie?()" do
    it "returns false given empty board" do
      grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      expect(board.tie?(grid)).to be false
    end

    it "returns true given marked board with no win" do
      grid = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      board = Board.new(grid)
      expect(board.tie?(grid)).to be true
    end
  end

  describe "#win?()" do
    it "returns false given board with no win" do
      grid = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      board = Board.new(grid)
      expect(board.win?(grid)).to be false
    end
  end
end
