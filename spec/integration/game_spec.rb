require "game"

describe Game do

  before :each do
    grid = ["O", "X", "O", "X", "O", "X", "X", 7, 8]
    @board = Board.new(grid)
    input = StringIO.new("0\nhello\n12\n7")
    @output = StringIO.new
    console = Console.new(@output, input)
    validator = Validator.new
    display = Display.new(console, validator)
    hard_computer_player = HardComputerPlayer.new(@board)
    human_player = HumanPlayer.new(display)
    game = Game.new(@board, display, hard_computer_player, human_player)
    game.start_game
  end

  context "plays one game" do
    it "returns 'Game over'" do
      expect(@output.string).to include("Game over")
    end

    it "returns Board" do
      expect(@output.string).to include(" O | X | O \n===+===+===\n X | O | X \n===+===+===\n X | O | X \n")
    end
  end
end
