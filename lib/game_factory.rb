class GameFactory

  FIRST_ELEMENT = 0
  SECOND_ELEMENT = 1
  SWITCH_PLAYERS = 2

  def initialize(player_factory, game_mode, display)
    @player_factory = player_factory
    @game_mode = game_mode
    @display = display
  end

  def create_game
    players = set_players
    board = Board.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
    Game.new(board, @display, players)
  end

  def set_players
    players = get_players
    @display.choose_first_player(player_one(players).name, player_two(players).name, player_one(players).mark, player_two(players).mark)
    user_choice = @display.get_valid_set_up_players_response(player_one(players).name, player_two(players).name, player_one(players).mark, player_two(players).mark)
    if user_choice == SWITCH_PLAYERS
      players.rotate!
    end
    players
  end

  private

  def get_players
    game_mode_choice = @game_mode.choose_game_mode(@display)
    @player_factory.set_up_players(game_mode_choice)
  end

  def player_one(players)
    players[FIRST_ELEMENT]
  end

  def player_two(players)
    players[SECOND_ELEMENT]
  end
end
