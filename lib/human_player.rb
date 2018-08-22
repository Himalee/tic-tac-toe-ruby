class HumanPlayer < Player

  def name
    "Human Player"
  end

  def get_move(board, player_one_mark, player_two_mark)
    @display.get_valid_cell(board, player_one_mark, player_two_mark)
  end
end
