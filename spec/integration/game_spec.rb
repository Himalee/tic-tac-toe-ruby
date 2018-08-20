require "game"
require "negamax"
require "hard_computer_player"

describe Game do

  before :each do
    grid = ["O", "X", "O", "X", "O", "X", "X", 7, 8]
    @board = Board.new(grid)
    input = StringIO.new("3\n0\nhello\n12\n7")
    @output = StringIO.new
    console = Console.new(@output, input)
    validator = Validator.new
    display = Display.new(console, validator)
    hard_computer_player = HardComputerPlayer.new(display, "X")
    human_player = HumanPlayer.new(display, "O")
    players = [human_player, hard_computer_player]
    game = Game.new(@board, display, players)
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
