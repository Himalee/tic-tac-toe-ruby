class GameMode

  def choose_game_mode(display)
    display.choose_game_mode
    response = display.valid_game_mode_response
  end
end
