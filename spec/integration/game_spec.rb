require "game"

describe Game do

  before :each do
    grid = ["O", "X", "O", "X", "O", "X", "X", 7, 8]
    @board = Board.new(grid)
    input = StringIO.new("7")
    @output = StringIO.new
    game = Game.new(@board, @output, input)
    game.start_game
  end

  context "plays one game" do
    it "returns 'Game over'" do
      expect(@output.string).to include("Game over")
    end

    it "returns Board" do
      expect(@board.grid).to eql(["O", "X", "O", "X", "O", "X", "X", "O", "X"])
    end
  end
end
