require "board"

describe Board do
  describe "#tie?()" do
    it "returns false given empty board" do
      grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      expect(board.tie?("O", "X")).to be false
    end

    it "returns true given marked board with no win" do
      grid = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      board = Board.new(grid)
      expect(board.tie?("O", "X")).to be true
    end
  end

  describe "#win?()" do
    it "returns false given board with no win" do
      grid = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      board = Board.new(grid)
      expect(board.win?).to be false
    end

    it "returns true given board with a win - row" do
      grid = ["X", "X", "X", 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      expect(board.win?).to be true
    end

    it "returns true given board with a win - column" do
      grid = ["X", 1, 2, "X", 4, 5, "X", 7, 8]
      board = Board.new(grid)
      expect(board.win?).to be true
    end

    it "returns true given board with a win - diagonal" do
      grid = ["X", 1, 2, 3, "X", 5, 6, 7, "X"]
      board = Board.new(grid)
      expect(board.win?).to be true
    end
  end

  describe "#mark_grid()" do
    it "returns a marked board given cell '0'" do
      grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      mark = "X"
      cell = 0
      board.mark_grid(grid, cell, mark)
      expect(board.grid).to eql(["X", 1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  describe "#available_spaces()" do
    it "returns array of available spaces" do
      grid = ["X", "O", 2, 3, "X", 5, "O", 7, "X"]
      board = Board.new(grid)
      expect(board.available_spaces("O", "X")).to eql([2, 3, 5, 7])
    end
  end
end
