class PlayerFactory

  HUMAN_VS_HUMAN = 1
  COMPUTER_VS_COMPUTER = 2
  HUMAN_VS_COMPUTER = 3

  def set_up_players(choice, display)
    case choice
    when HUMAN_VS_HUMAN
      [HumanPlayer.new(display, "O"), HumanPlayer.new(display, "X")]
    when COMPUTER_VS_COMPUTER
      [HardComputerPlayer.new(display, "O"), HardComputerPlayer.new(display, "X")]
    when HUMAN_VS_COMPUTER
      [HumanPlayer.new(display, "O"), HardComputerPlayer.new(display, "X")]
    end
  end
end
