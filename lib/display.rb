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
end
