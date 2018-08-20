class HumanPlayer < Player

  def get_move(board)
    @display.get_valid_cell(board)
  end
end
