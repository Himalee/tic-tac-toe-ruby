require_relative "game"
require_relative "board"
require_relative "display"
require_relative "console"
require_relative "message"
require_relative "validator"
require_relative "player"
require_relative "hard_computer_player"
require_relative "human_player"
require_relative "negamax"
require_relative "game_factory"

game_factory = GameFactory.new
game_factory.create_game
