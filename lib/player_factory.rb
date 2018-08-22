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
      [human_player, human_player]
    when COMPUTER_VS_COMPUTER
      [computer_player, computer_player]
    when HUMAN_VS_COMPUTER
      [human_player, computer_player]
    end
  end

  def human_player
    HumanPlayer.new(@display, choose_mark)
  end

  def computer_player
    HardComputerPlayer.new(@display, choose_mark)
  end

  def choose_mark
    @display.choose_mark_prompt
    mark = @display.get_mark
    mark
  end
end
