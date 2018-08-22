require "player_factory"

describe PlayerFactory do

  FIRST_ELEMENT = 0
  SECOND_ELEMENT = 1

  it "returns 2 human players" do
    validator = Validator.new
    input = StringIO.new("O\nX")
    output = StringIO.new
    console = Console.new(output, input)
    display = Display.new(console, validator)
    player_factory = PlayerFactory.new(display)
    choice = 1
    players = player_factory.set_up_players(choice)
    expect(players[FIRST_ELEMENT]).to be_a(HumanPlayer)
    expect(players[SECOND_ELEMENT]).to be_a(HumanPlayer)
  end
end
