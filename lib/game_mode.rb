class GameMode

  def choose_game_mode(display)
    display.choose_game_mode
    response = display.get_valid_game_mode_response
  end
end
