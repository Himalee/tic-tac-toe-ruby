class HardComputerPlayer

  def initialize(board)
    @board = board
    @com = "X"
  end

  def get_move(board)
    mark = @com
    Negamax.new(board).get_best_move(board.grid, mark)
  end
end
