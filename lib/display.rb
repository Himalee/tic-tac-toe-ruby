class Display

  def initialize(console = Console.new, message = Message.new)
    @console = console
    @message = message
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

  def get_cell
    @console.receive.to_i
  end

  def prompt_for_cell
    @console.present(@message.prompt_for_cell)
  end

  def chosen_cell(choice)
    @console.present(@message.chosen_cell(choice))
  end
end