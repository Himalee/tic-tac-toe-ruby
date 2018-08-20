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

  def receive_integer
    user_input = receive_string
    until @validator.valid_input?(user_input)
      prompt_for_cell
      user_input = receive_string
    end
    user_input.to_i
  end

  def get_valid_cell(board)
    choice = receive_integer
    until @validator.valid_cell?(board, choice)
      prompt_for_cell
      choice = receive_integer
    end
    choice
  end

  def prompt_for_cell
    @console.present(@message.prompt_for_cell)
  end

  def chosen_cell(choice)
    @console.present(@message.chosen_cell(choice))
  end
end
