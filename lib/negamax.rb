class Negamax

  def initialize(board)
    @board = board
  end

  def get_best_move(grid, depth=0, best_score={}, mark, player_one_mark, player_two_mark)
    return 0 if @board.tie?(grid, player_one_mark, player_two_mark)
    return -1 if @board.win?(grid)
    @board.available_spaces(grid, player_one_mark, player_two_mark).each do |cell|
      possible_grid = grid.dup
      other_grid = @board.mark_grid(possible_grid, cell, mark)
      opponent_mark = get_opponent_mark(mark, player_one_mark, player_two_mark)
      best_score[cell] = -1 * get_best_move(other_grid, depth + 1, {}, opponent_mark, player_one_mark, player_two_mark)
    end
    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]
    if depth == 0
      return best_move
    elsif depth > 0
      return highest_minimax_score
    end
  end

  private

  def get_opponent_mark(mark, player_one_mark, player_two_mark)
    if mark == player_one_mark
      player_two_mark
    else
      player_one_mark
    end
  end
end
