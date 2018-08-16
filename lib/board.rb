class Board

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def end_of_game?(grid)
    tie?(grid) || win?(grid)
  end

  def tie?(grid)
    grid.all? { |cell| cell == "X" || cell == "O" }
  end

  def win?(grid)
    all_winning_combinations(grid).any? {|line| line.uniq.length == 1}
  end

  def mark_grid(grid, cell, mark)
    grid[cell] = mark
    grid
  end

  def available_cell?(grid, cell)
    grid[cell] != "X" && grid[cell] != "O"
  end

  def mark_grid_with_valid_cell(cell, mark)
    if available_cell?(@grid, cell)
      mark_grid(@grid, cell, mark)
    else
      cell = nil
    end
  end

  def available_spaces(grid)
    available_spaces = []
    grid.each do |cell|
      if cell != "X" && cell != "O"
        available_spaces << cell
      end
    end
    available_spaces
  end

  def random_available_space(grid)
    available_spaces(grid).sample
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
