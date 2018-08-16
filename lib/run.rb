require_relative "game"
require_relative "board"
require_relative "display"
require_relative "console"
require_relative "message"
require_relative "validator"


board = Board.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
validator = Validator.new(board)
display = Display.new(validator)
game = Game.new(board, display)
game.start_game
