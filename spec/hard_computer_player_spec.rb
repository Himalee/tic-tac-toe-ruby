require "player"
require "hard_computer_player"


describe HardComputerPlayer do
  it "returns name" do
    hard_computer_player = HardComputerPlayer.new("", "")
    expect(hard_computer_player.name).to eql("Computer Player")
  end
end
