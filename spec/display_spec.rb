require "display"
require "message"

describe Display do
  it "presents board" do
    output = StringIO.new
    console = Console.new(output)
    display = Display.new(console)
    grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    display.present_board(grid)
    expect(output.string).to eql(" 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n")
  end
end
