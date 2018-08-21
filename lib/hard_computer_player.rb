class HardComputerPlayer < Player

  def name
    "Computer Player"
  end

  def get_move(board)
    Negamax.new(board).get_best_move(board.grid, self.mark)
  end
end
