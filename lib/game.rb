class Game

  FIRST_ELEMENT = 0
  SECOND_ELEMENT = 1

  def initialize(board, display, players)
    @board = board
    @display = display
    @players = players
  end

  def start_game
    @display.welcome
    display_board
    player_turns
    result
  end

  private

  def display_board
    @display.present_board(@board)
  end

  def player_turns
    until @board.end_of_game?(current_player.mark, opponent.mark)
      @display.prompt_for_cell
      cell = current_player.get_move(@board, current_player.mark, opponent.mark)
      @board = @board.new_board(cell, current_player.mark)
      display_board
      @display.chosen_cell(cell)
      next_player
    end
  end

  def current_player
    @players[FIRST_ELEMENT]
  end

  def opponent
    @players[SECOND_ELEMENT]
  end

  def next_player
    @players.rotate!
  end

  def result
    if @board.tie?(current_player.mark, opponent.mark)
      @display.draw
    else
      @display.game_over
    end
  end
end
