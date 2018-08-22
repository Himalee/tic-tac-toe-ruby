require "player_factory"

describe PlayerFactory do

  FIRST_ELEMENT = 0
  SECOND_ELEMENT = 1

  before :each do
    validator = Validator.new
    input = StringIO.new("O\nX")
    output = StringIO.new
    console = Console.new(output, input)
    display = Display.new(console, validator)
    @player_factory = PlayerFactory.new(display)
  end

  it "returns 2 human players" do
    choice = 1
    players = @player_factory.set_up_players(choice)
    expect(players[FIRST_ELEMENT]).to be_a(HumanPlayer)
    expect(players[SECOND_ELEMENT]).to be_a(HumanPlayer)
  end

  it "returns 2 computer players" do
    choice = 2
    players = @player_factory.set_up_players(choice)
    expect(players[FIRST_ELEMENT]).to be_a(HardComputerPlayer)
    expect(players[SECOND_ELEMENT]).to be_a(HardComputerPlayer)
  end

  it "returns a human player and a computer player" do
    choice = 3
    players = @player_factory.set_up_players(choice)
    expect(players[FIRST_ELEMENT]).to be_a(HumanPlayer)
    expect(players[SECOND_ELEMENT]).to be_a(HardComputerPlayer)
  end
end
