class Display

  def initialize(console = Console.new)
    @console = console
  end

  def present_board(grid)
    @console.present(" #{grid[0]} | #{grid[1]} | #{grid[2]} #{new_line} #{grid[3]} | #{grid[4]} | #{grid[5]} #{new_line} #{grid[6]} | #{grid[7]} | #{grid[8]} \n")
  end

  def new_line
    "\n===+===+===\n"
  end

  def game_over
    @console.present("Game over")
  end

  def get_cell
    @console.receive.to_i
  end

  def prompt_for_cell
    @console.present("Enter [0-8]:")
  end
end
