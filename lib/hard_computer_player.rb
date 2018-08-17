class HardComputerPlayer

  def initialize
    @com = "X"
  end

  def get_move(board)
    mark = @com
    Negamax.new(board).get_best_move(board.grid, mark)
  end
end
