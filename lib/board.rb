class Board

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def end_of_game?(grid, player_one_mark, player_two_mark)
    tie?(grid, player_one_mark, player_two_mark) || win?(grid)
  end

  def tie?(grid, player_one_mark, player_two_mark)
    grid.all? { |cell| cell == player_one_mark || cell == player_two_mark }
  end

  def win?(grid)
    all_winning_combinations(grid).any? {|line| line.uniq.length == 1}
  end

  def mark_grid(grid, cell, mark)
    grid[cell] = mark
    grid
  end

  def new_board(cell, mark)
    current_grid = @grid.dup
    new_grid = mark_grid(current_grid, cell, mark)
    Board.new(new_grid)
  end

  def available_spaces(grid, player_one_mark, player_two_mark)
    available_spaces = []
    grid.each do |cell|
      if cell != player_one_mark && cell != player_two_mark
        available_spaces << cell
      end
    end
    available_spaces
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
