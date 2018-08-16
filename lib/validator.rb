class Validator

  def valid_cell?(board, choice)
    board.available_spaces(board.grid).include?(choice)
  end
end
