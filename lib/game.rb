class Game
  def initialize(board, output = $stdout, input = $stdin)
    @board = board
    @com = "X"
    @hum = "O"
    @output = output
    @input = input
  end

  def start_game
    @output.puts " #{@board.grid[0]} | #{@board.grid[1]} | #{@board.grid[2]} \n===+===+===\n #{@board.grid[3]} | #{@board.grid[4]} | #{@board.grid[5]} \n===+===+===\n #{@board.grid[6]} | #{@board.grid[7]} | #{@board.grid[8]} \n"
    @output.puts "Enter [0-8]:"
    until @board.end_of_game?(@board.grid)
      get_human_spot
      if !@board.end_of_game?(@board.grid)
        eval_board
      end
      @output.puts " #{@board.grid[0]} | #{@board.grid[1]} | #{@board.grid[2]} \n===+===+===\n #{@board.grid[3]} | #{@board.grid[4]} | #{@board.grid[5]} \n===+===+===\n #{@board.grid[6]} | #{@board.grid[7]} | #{@board.grid[8]} \n"
    end
    @output.puts "Game over"
  end

  def get_human_spot
    spot = nil
    until spot
      spot = @input.gets.chomp.to_i
      if @board.available_cell?(@board.grid, spot)
        @board.mark_grid(@board.grid, spot, @hum)
      else
        spot = nil
      end
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
        if @board.available_cell?(@board.grid, spot)
          @board.mark_grid(@board.grid, spot, @com)
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
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
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end
end
