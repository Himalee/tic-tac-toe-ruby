require "game_factory"

describe GameFactory do
  context "human vs human game" do
    it "sets first player as 'X'" do
      output = StringIO.new
      input = StringIO.new("1\n2")
      console = Console.new(output, input)
      validator = Validator.new
      display = Display.new(console, validator)
      player_factory = PlayerFactory.new
      game_mode = GameMode.new
      game_factory = GameFactory.new(player_factory, game_mode, display)
      first_player = game_factory.set_players[0]
      expect(first_player.mark).to eql("X")
    end
  end
end
