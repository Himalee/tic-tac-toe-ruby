class Game
  def initialize(board, display)
    @board = board
    @com = "X"
    @hum = "O"
    @display = display
  end

  def start_game
    @display.welcome
    display_board
    until @board.end_of_game?(@board.grid)
      @display.prompt_for_cell
      get_human_cell
      if !@board.end_of_game?(@board.grid)
        eval_board
      end
    end
    @display.game_over
  end

  private

  def display_board
    @display.present_board(@board.grid)
  end

  def get_human_cell
    cell = nil
    until cell
      cell = @display.get_cell
      @board.mark_grid_with_valid_cell(cell, @hum)
      display_board
      @display.chosen_cell(cell)
    end
  end

  def eval_board
    cell = nil
    until cell
      if @board.grid[4] == "4"
        cell = 4
        @board.mark_grid(@board.grid, cell, @com)
        display_board
        @display.chosen_cell(cell)
      else
        cell = get_best_move(@board.grid, @com)
        @board.mark_grid_with_valid_cell(cell, @com)
        display_board
        @display.chosen_cell(cell)
      end
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    best_move = nil
    @board.available_spaces(board).each do |cell|
      board[cell.to_i] = @com
      if @board.win?(board)
        best_move = cell.to_i
        board[cell.to_i] = cell
        return best_move
      else
        board[cell.to_i] = @hum
        if @board.win?(board)
          best_move = cell.to_i
          board[cell.to_i] = cell
          return best_move
        else
          board[cell.to_i] = cell
        end
      end
    end
    if best_move
      return best_move
    else
      return @board.random_available_space(board)
    end
  end
end
