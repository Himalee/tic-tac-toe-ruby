class Display

  def initialize(console = Console.new, message = Message.new, validator)
    @console = console
    @message = message
    @validator = validator
  end

  def present_board(grid)
    @console.present(" #{grid[0]} | #{grid[1]} | #{grid[2]} #{insert_line} #{grid[3]} | #{grid[4]} | #{grid[5]} #{insert_line} #{grid[6]} | #{grid[7]} | #{grid[8]} \n")
  end

  def welcome
    @console.present(@message.welcome)
  end

  def insert_line
    "\n===+===+===\n"
  end

  def game_over
    @console.present(@message.end_of_game)
  end

  def receive_string
    @console.receive
  end

  def receive_integer_for_cell_choice
    user_input = receive_string
    until @validator.valid_input?(user_input)
      prompt_for_cell
      user_input = receive_string
    end
    user_input.to_i
  end

  def get_valid_cell(board, player_one_mark, player_two_mark)
    choice = receive_integer_for_cell_choice
    until @validator.valid_cell?(board, choice, player_one_mark, player_two_mark)
      prompt_for_cell
      choice = receive_integer_for_cell_choice
    end
    choice
  end

  def receive_integer
    @console.receive.to_i
  end

  def prompt_for_cell
    @console.present(@message.prompt_for_cell)
  end

  def chosen_cell(choice)
    @console.present(@message.chosen_cell(choice))
  end

  def choose_game_mode
    @console.present(@message.game_mode)
  end

  def valid_game_mode_response
    choice = receive_integer
    until @validator.valid_game_mode?(choice)
      choose_game_mode
      choice = receive_integer
    end
    choice
  end

  def valid_set_up_players_response(first_type, second_type, first_mark, second_mark)
    choice = receive_integer
    until @validator.valid_set_players_mode?(choice)
      choose_first_player(first_type, second_type, first_mark, second_mark)
      choice = receive_integer
    end
    choice
  end

  def choose_first_player(first_type, second_type, first_mark, second_mark)
    @console.present(@message.choose_first_player(first_type, second_type, first_mark, second_mark))
  end

  def choose_mark_prompt
    @console.present(@message.choose_mark)
  end

  def get_mark
    mark = receive_string
    until @validator.valid_mark?(mark)
      choose_mark_prompt
      mark = receive_string
    end
    mark
  end
end
