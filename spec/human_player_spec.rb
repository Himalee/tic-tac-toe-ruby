require "human_player"
require "board"
require "validator"
require "console"
require "display"
require "message"

describe HumanPlayer do

  it "validate user input" do
    grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    board = Board.new(grid)
    validator = Validator.new
    output = StringIO.new
    input = StringIO.new("33\n3")
    console = Console.new(output, input)
    display = Display.new(console, validator)
    human_player = HumanPlayer.new(display)
    expect(human_player.get_move(board)).to eql(3)
  end
end
