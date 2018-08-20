class Validator

  VALID_GAME_MODES = [1, 2, 3]

  def valid_cell?(board, choice)
    board.available_spaces(board.grid).include?(choice)
  end

  def valid_input?(input)
    ("0".."8").to_a.include?(input)
  end

  def valid_game_mode?(choice)
    VALID_GAME_MODES.include?(choice)
  end
end
