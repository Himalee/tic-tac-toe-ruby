class PlayerFactory

  HUMAN_VS_HUMAN = 1
  COMPUTER_VS_COMPUTER = 2
  HUMAN_VS_COMPUTER = 3

  def initialize(display)
    @display = display
  end

  def set_up_players(choice)
    case choice
    when HUMAN_VS_HUMAN
      [HumanPlayer.new(@display, choose_mark), HumanPlayer.new(@display, choose_mark)]
    when COMPUTER_VS_COMPUTER
      [HardComputerPlayer.new(@display, choose_mark), HardComputerPlayer.new(@display, choose_mark)]
    when HUMAN_VS_COMPUTER
      [HumanPlayer.new(@display, choose_mark), HardComputerPlayer.new(@display, choose_mark)]
    end
  end

  def choose_mark
    @display.choose_mark_prompt
    mark = @display.get_mark
    mark
  end
end
