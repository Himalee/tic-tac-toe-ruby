class Game
  def initialize(board, display, players)
    @board = board
    @com = "X"
    @hum = "O"
    @display = display
    @players = players
  end

  def start_game
    @display.welcome
    display_board
    until @board.end_of_game?(@board.grid)
      @display.prompt_for_cell
      get_human_cell
      if !@board.end_of_game?(@board.grid)
        get_computer_cell
      end
    end
    @display.game_over
  end

  private

  def get_human_cell
    cell = @players[0].get_move(@board)
    player_turn(cell, @hum)
  end

  def get_computer_cell
    cell = @players[1].get_move(@board)
    player_turn(cell, @com)
  end

  def player_turn(cell, mark)
    @board = @board.new_board(cell, mark)
    display_board
    @display.chosen_cell(cell)
  end

  def display_board
    @display.present_board(@board.grid)
  end
end
