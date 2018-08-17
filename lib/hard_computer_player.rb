class HardComputerPlayer

  def initialize(board)
    @board = board
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
