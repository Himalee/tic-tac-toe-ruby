class Board

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def tie?(grid)
    grid.all? { |cell| cell == "X" || cell == "O" }
  end
end
