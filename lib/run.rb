require_relative "game"
require_relative "board"
require_relative "display"
require_relative "console"

display = Display.new
board = Board.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
game = Game.new(board, display)
game.start_game
