require "game_factory"

describe GameFactory do

  FIRST_ELEMENT = 0

  context "creates a Game" do
    before :each do
      output = StringIO.new
      input = StringIO.new("1\nO\nX\n2")
      console = Console.new(output, input)
      validator = Validator.new
      display = Display.new(console, validator)
      player_factory = PlayerFactory.new(display)
      game_mode = GameMode.new
      @game_factory = GameFactory.new(player_factory, game_mode, display)
    end

    it "returns a Game" do
      expect(@game_factory.create_game).to be_a(Game)
    end

    it "sets first player mark as 'X'" do
      first_player = @game_factory.set_players[FIRST_ELEMENT]
      expect(first_player.mark).to eql("X")
    end
  end
end
