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
    "Would you like to play:\n1. Human vs Human\n2. Computer vs Computer\n3. Human vs Computer\nEnter 1, 2 or 3"
  end

  def choose_first_player(first_type, second_type, first_mark, second_mark)
    "Which player would like to play first:\n1.#{first_type} with mark #{first_mark} \n2.#{second_type} with mark #{second_mark}\nEnter 1 or 2"
  end

  def choose_mark(player_type)
    "Please choose and enter a mark that is one character long for: #{player_type}"
  end

  def draw
    "It's a draw"
  end
end
