require "game"
require "negamax"
require "hard_computer_player"

describe Game do

  let :validator { Validator.new }
  let :output { StringIO.new }

  describe "human vs human game" do

    before :each do
      grid = ["O", "X", "O", "X", "O", "X", 6, 7, 8]
      board = Board.new(grid)
      input = StringIO.new("3\n0\nhello\n12\n8\n6")
      console = Console.new(output, input)
      display = Display.new(console, validator)
      human_player_one = HumanPlayer.new(display, "X")
      human_player_two = HumanPlayer.new(display, "O")
      players = [human_player_one, human_player_two]
      game = Game.new(board, display, players)
      game.start_game
    end

    it "returns 'Game over'" do
      expect(output.string).to include("Game over")
    end

    it "returns final grid" do
      expect(output.string).to include(" O | X | O \n===+===+===\n X | O | X \n===+===+===\n O | 7 | X \n")
    end
  end

  describe "computer vs computer game" do
    it "returns a draw" do
      grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new(grid)
      input = StringIO.new
      console = Console.new(output, input)
      display = Display.new(console, validator)
      hard_computer_player_one = HardComputerPlayer.new(display, "X")
      hard_computer_player_two = HardComputerPlayer.new(display, "O")
      players = [hard_computer_player_one, hard_computer_player_two]
      game = Game.new(board, display, players)
      game.start_game
      expect(output.string).to include("draw")
    end
  end
end
