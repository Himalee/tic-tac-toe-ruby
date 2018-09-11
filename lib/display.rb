class Display

  def initialize(console = Console.new, message = Message.new, validator)
    @console = console
    @message = message
    @validator = validator
  end

  def welcome
    @console.present(@message.welcome)
  end

  def game_over
    @console.present(@message.end_of_game)
  end

  def draw
    @console.present(@message.draw)
  end

  def get_valid_cell(board, player_one_mark, player_two_mark)
    choice = receive_string
    until @validator.valid_cell?(choice) && @validator.available_cell?(board, choice.to_i, player_one_mark, player_two_mark)
      prompt_for_cell
      choice = receive_string
    end
    choice.to_i
  end

  def prompt_for_cell
    @console.present(@message.prompt_for_cell)
  end

  def chosen_cell(choice)
    @console.present(@message.chosen_cell(choice))
  end

  def get_valid_game_mode_response
    choice = receive_integer
    until @validator.valid_game_mode?(choice)
      choose_game_mode
      choice = receive_integer
    end
    choice
  end

  def choose_game_mode
    @console.present(@message.game_mode)
  end

  def get_valid_set_up_players_response(first_type, second_type, first_mark, second_mark)
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

  def get_mark(player_type)
    mark = receive_string
    until @validator.valid_mark?(mark)
      choose_mark_prompt(player_type)
      mark = receive_string
    end
    mark
  end

  def choose_mark_prompt(player_type)
    @console.present(@message.choose_mark(player_type))
  end

  private

  def receive_string
    @console.receive
  end

  def receive_integer
    @console.receive.to_i
  end
end
