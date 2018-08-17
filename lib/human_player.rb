class HumanPlayer

  def initialize(display)
    @display = display
  end

  def get_move(board)
    @display.get_valid_cell(board)
  end
end
