class Validator

  VALID_GAME_MODES = [1, 2, 3]
  VALID_CELLS = ("0".."8").to_a
  VALID_SET_PLAYERS_MODES = [1, 2]

  def available_cell?(board, choice, player_one_mark, player_two_mark)
    board.available_spaces(board.grid, player_one_mark, player_two_mark).include?(choice)
  end

  def valid_cell?(input)
    VALID_CELLS.include?(input)
  end

  def valid_game_mode?(choice)
    VALID_GAME_MODES.include?(choice)
  end

  def valid_set_players_mode?(choice)
    VALID_SET_PLAYERS_MODES.include?(choice)
  end

  def valid_mark?(mark)
    mark.length == 1
  end
end
