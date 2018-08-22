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
    @display.game_over
  end

  private

  def display_board
    @display.present_board(@board.grid)
  end

  def player_turns
    until @board.end_of_game?(@board.grid, player_marks[FIRST_ELEMENT], player_marks[SECOND_ELEMENT])
      @display.prompt_for_cell
      cell = current_player.get_move(@board, player_marks[FIRST_ELEMENT], player_marks[SECOND_ELEMENT])
      @board = @board.new_board(cell, current_player.mark)
      display_board
      @display.chosen_cell(cell)
      next_player
    end
  end

  def current_player
    @players[FIRST_ELEMENT]
  end

  def next_player
    @players.rotate!
  end

  def player_marks
    [@players[FIRST_ELEMENT].mark, @players[SECOND_ELEMENT].mark]
  end
end
