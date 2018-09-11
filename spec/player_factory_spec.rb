require "player_factory"

describe PlayerFactory do

  FIRST_ELEMENT = 0
  SECOND_ELEMENT = 1
  COMPUTER_VS_COMPUTER = 2
  HUMAN_VS_COMPUTER = 3

  before :each do
    validator = Validator.new
    input = StringIO.new("O\nxx\nX")
    output = StringIO.new
    console = Console.new(output, input)
    display = Display.new(console, validator)
    @player_factory = PlayerFactory.new(display)
  end

  it "returns a human player and a computer player" do
    choice = HUMAN_VS_COMPUTER
    players = @player_factory.set_up_players(choice)
    expect(players[FIRST_ELEMENT]).to be_a(HumanPlayer)
    expect(players[SECOND_ELEMENT]).to be_a(HardComputerPlayer)
  end

  it "sets second player mark as 'X' given invalid marks" do
    choice = COMPUTER_VS_COMPUTER
    players = @player_factory.set_up_players(choice)
    second_player = players[SECOND_ELEMENT]
    expect(second_player.mark).to eql("X")
  end
end
