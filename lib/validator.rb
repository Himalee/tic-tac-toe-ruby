class Validator

  VALID_GAME_MODES = [1, 2, 3]
  VALID_CELLS = ("0".."8").to_a
  VALID_SET_PLAYERS_MODES = [1, 2]

  def valid_cell?(board, choice)
    board.available_spaces(board.grid).include?(choice)
  end

  def valid_input?(input)
    VALID_CELLS.include?(input)
  end

  def valid_game_mode?(choice)
    VALID_GAME_MODES.include?(choice)
  end

  def valid_set_players_mode?(choice)
    VALID_SET_PLAYERS_MODES.include?(choice)
  end
end
