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
    player_turns
    @display.game_over
  end

  private

  def display_board
    @display.present_board(@board.grid)
  end

  def player_turns
    until @board.end_of_game?(@board.grid)
      @display.prompt_for_cell
      cell = current_player.get_move(@board)
      @board = @board.new_board(cell, current_player.mark)
      display_board
      @display.chosen_cell(cell)
      next_player
    end
  end

  def current_player
    @players[0]
  end

  def next_player
    @players.rotate!
  end
end
