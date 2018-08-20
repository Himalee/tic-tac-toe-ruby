class PlayerFactory

  def set_up_players(display)
    [HumanPlayer.new(display, "O"), HardComputerPlayer.new(display, "X")]
  end
end
