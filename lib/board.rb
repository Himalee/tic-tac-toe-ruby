class Board

  attr_reader :grid

  def initialize(grid)
    @grid = grid
    @dimension = Math.sqrt(grid.size)
  end

  def tie?(grid)
    grid.all? { |cell| cell == "X" || cell == "O" }
  end

  def win?(grid)
    all_winning_combinations(grid).any? {|line| line.uniq.length == 1}
  end

  private

  def all_winning_combinations(grid)
    [[grid[0], grid[1], grid[2]],
    [grid[3], grid[4], grid[5]],
    [grid[6], grid[7], grid[8]],
    [grid[0], grid[3], grid[6]],
    [grid[1], grid[4], grid[7]],
    [grid[2], grid[5], grid[8]],
    [grid[0], grid[4], grid[8]],
    [grid[2], grid[4], grid[6]]]
  end
end
