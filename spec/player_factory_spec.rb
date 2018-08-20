require "player_factory"

describe PlayerFactory do

  before :each do
    validator = Validator.new
    @display = Display.new(validator)
    @player_factory = PlayerFactory.new
  end

  it "returns 2 human players" do
    choice = 1
    expect(@player_factory.set_up_players(choice, @display)[0]).to be_a(HumanPlayer)
    expect(@player_factory.set_up_players(choice, @display)[1]).to be_a(HumanPlayer)
  end

  it "returns 2 computer players" do
    choice = 2
    expect(@player_factory.set_up_players(choice, @display)[0]).to be_a(HardComputerPlayer)
    expect(@player_factory.set_up_players(choice, @display)[1]).to be_a(HardComputerPlayer)
  end

  it "returns a human player and a computer player" do
    choice = 3
    expect(@player_factory.set_up_players(choice, @display)[0]).to be_a(HumanPlayer)
    expect(@player_factory.set_up_players(choice, @display)[1]).to be_a(HardComputerPlayer)
  end
end
