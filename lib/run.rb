require_relative "game"
require_relative "board"
require_relative "display"
require_relative "console"
require_relative "message"
require_relative "validator"
require_relative "hard_computer_player"
require_relative "human_player"


board = Board.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
validator = Validator.new
display = Display.new(validator)
hard_computer_player = HardComputerPlayer.new(board)
human_player = HumanPlayer.new(display)
game = Game.new(board, display, hard_computer_player, human_player)
game.start_game
