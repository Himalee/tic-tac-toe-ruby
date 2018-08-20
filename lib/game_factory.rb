class GameFactory

  def initialize(player_factory)
    @player_factory = player_factory
  end

  def create_game
    board = Board.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
    validator = Validator.new
    display = Display.new(validator)
    players = @player_factory.set_up_players(display)
    game = Game.new(board, display, players)
    game.start_game
  end
end
