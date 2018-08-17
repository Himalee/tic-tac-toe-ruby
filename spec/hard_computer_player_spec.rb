require "hard_computer_player"
require "board"

describe HardComputerPlayer do
  describe "#get_best_move()" do
    it "returns cell given grid with one move left" do
      grid = ["X", "O", "X", "O", "O", "X", "X", 8, "O"]
      board = Board.new(grid)
      hard_computer_player = HardComputerPlayer.new(board)
      expect(hard_computer_player.get_best_move(grid, "X")).to eql(8)
    end
  end
end
