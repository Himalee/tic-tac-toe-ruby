class HumanPlayer < Player

  def name
    "Human Player"
  end

  def get_move(board)
    @display.get_valid_cell(board)
  end
end
