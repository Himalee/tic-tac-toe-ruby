class Validator
  def initialize(board)
    @board = board
  end

  def valid_cell?(choice)
    @board.available_spaces(@board.grid).include?(choice)
  end
end
