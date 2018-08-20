class GameFactory

  def create_game
    board = Board.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
    validator = Validator.new
    display = Display.new(validator)
    hard_computer_player = HardComputerPlayer.new(display, "X")
    human_player = HumanPlayer.new(display, "O")
    players = [human_player, hard_computer_player]
    game = Game.new(board, display, players)
    game.start_game
  end
end
