class Validator

  def valid_cell?(board, choice)
    board.available_spaces(board.grid).include?(choice)
  end

  def valid_input?(input)
    ("0".."8").to_a.include?(input)
  end
end
