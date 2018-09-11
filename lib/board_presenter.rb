class BoardPresenter

  def initialize(console = Console.new)
    @console = console
  end

  def present_board(board)
    presentable_board = ""
    board.grid.each_with_index { |cell, index|
    if (index + 1) == board.max_number_of_cells
      presentable_board << " #{cell} \n"
    elsif (index + 1) % board.size == 0
      presentable_board << " #{cell} #{insert_line}"
    else
      presentable_board << " #{cell} |"
    end }
    @console.present(presentable_board)
  end

  def insert_line
    "\n===+===+===\n"
  end
end
