class Message

  def welcome
    "Welcome to Tic Tac Toe"
  end

  def end_of_game
    "Game over"
  end

  def prompt_for_cell
    "Please enter a number between 0 and 8 to place your mark"
  end

  def chosen_cell(cell)
    "Cell #{cell} was chosen"
  end

  def game_mode
    "Would you like to play:\n1. Human vs Human\n2. Computer vs Computer\n3. Human vs Computer"
  end
end
