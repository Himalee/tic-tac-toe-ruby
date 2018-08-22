class HardComputerPlayer < Player

  def name
    "Computer Player"
  end

  def get_move(board, player_one_mark, player_two_mark)
    Negamax.new(board).get_best_move(board.grid, self.mark, player_one_mark, player_two_mark)
  end
end
