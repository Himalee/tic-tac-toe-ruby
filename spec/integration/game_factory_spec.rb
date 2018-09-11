require "game_factory"

describe GameFactory do
  it "returns a Game" do
    output = StringIO.new
    input = StringIO.new("1\nO\nX\n2")
    console = Console.new(output, input)
    validator = Validator.new
    display = Display.new(console, validator)
    player_factory = PlayerFactory.new(display)
    game_mode = GameMode.new
    game_factory = GameFactory.new(player_factory, game_mode, display)
    expect(game_factory.create_game).to be_a(Game)
  end
end
