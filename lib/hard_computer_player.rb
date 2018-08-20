class HardComputerPlayer < Player

  def get_move(board)
    Negamax.new(board).get_best_move(board.grid, self.mark)
  end
end
