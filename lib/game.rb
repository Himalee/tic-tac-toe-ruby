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

  def get_human_cell
    cell = nil
    until cell
      cell = @display.get_valid_cell
      player_turn(cell, @hum)
    end
  end

  def eval_board
    cell = nil
    until cell
      if @board.grid[4] == "4"
        cell = 4
        player_turn(cell, @com)
      else
        cell = get_best_move(@board.grid, @com)
        player_turn(cell, @com)
      end
    end
  end

  def player_turn(cell, mark)
    @board.mark_grid(@board.grid, cell, mark)
    display_board
    @display.chosen_cell(cell)
  end

  def display_board
    @display.present_board(@board.grid)
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
