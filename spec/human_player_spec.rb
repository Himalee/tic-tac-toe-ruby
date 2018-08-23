require "player"
require "human_player"
require "board"
require "validator"
require "console"
require "display"
require "message"

describe HumanPlayer do
  before :each do
    grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @board = Board.new(grid)
    @validator = Validator.new
    @output = StringIO.new
  end

  it "validates user input with integer input" do
    input = StringIO.new("33\n3")
    console = Console.new(@output, input)
    display = Display.new(console, @validator)
    human_player = HumanPlayer.new(display, "O")
    expect(human_player.get_move(@board, "O", "X")).to eql(3)
  end

  it "validates user input with non integer input" do
    input = StringIO.new("hello\n45\n4")
    console = Console.new(@output, input)
    display = Display.new(console, @validator)
    human_player = HumanPlayer.new(display, "O")
    expect(human_player.get_move(@board, "O", "X")).to eql(4)
  end
end
