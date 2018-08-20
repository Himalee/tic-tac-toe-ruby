class GameFactory

  def initialize(player_factory, game_mode)
    @player_factory = player_factory
    @game_mode = game_mode
  end

  def create_game
    board = Board.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
    validator = Validator.new
    display = Display.new(validator)
    players = @player_factory.set_up_players(@game_mode.choose_game_mode(display), display)
    game = Game.new(board, display, players)
    game.start_game
  end
end
