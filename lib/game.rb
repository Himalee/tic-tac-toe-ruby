class Game
  def initialize(board, output = $stdout, input = $stdin)
    @board = board
    @com = "X" # the computer's marker
    @hum = "O" # the user's marker
    @output = output
    @input = input
  end

  def start_game
    # start by printing the board
    @output.puts " #{@board.grid[0]} | #{@board.grid[1]} | #{@board.grid[2]} \n===+===+===\n #{@board.grid[3]} | #{@board.grid[4]} | #{@board.grid[5]} \n===+===+===\n #{@board.grid[6]} | #{@board.grid[7]} | #{@board.grid[8]} \n"
    @output.puts "Enter [0-8]:"
    # loop through until the game was won or tied
    until game_is_over(@board.grid) || @board.tie?(@board.grid)
      get_human_spot
      if !game_is_over(@board.grid) && !@board.tie?(@board.grid)
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
      if @board.grid[spot] != "X" && @board.grid[spot] != "O"
        @board.grid[spot] = @hum
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
        @board.grid[spot] = @com
      else
        spot = get_best_move(@board.grid, @com)
        if @board.grid[spot] != "X" && @board.grid[spot] != "O"
          @board.grid[spot] = @com
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
      if game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @hum
        if game_is_over(board)
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

  def game_is_over(b)

    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end
end
