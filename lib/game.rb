class Game
  def initialize(board, display)
    @board = board
    @com = "X"
    @hum = "O"
    @display = display
  end

  def start_game
    display_board
    @display.prompt_for_cell
    until @board.end_of_game?(@board.grid)
      get_human_spot
      if !@board.end_of_game?(@board.grid)
        eval_board
      end
      display_board
    end
    @display.game_over
  end

  def display_board
    @display.present_board(@board.grid)
  end

  def get_human_spot
    spot = nil
    until spot
      spot = @display.get_cell
      @board.mark_grid_with_valid_cell(spot, @hum)
    end
  end

  def eval_board
    spot = nil
    until spot
      if @board.grid[4] == "4"
        spot = 4
        @board.mark_grid(@board.grid, spot, @com)
      else
        spot = get_best_move(@board.grid, @com)
        @board.mark_grid_with_valid_cell(spot, @com)
      end
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    best_move = nil
    @board.available_spaces(board).each do |as|
      board[as.to_i] = @com
      if @board.win?(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @hum
        if @board.win?(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
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
