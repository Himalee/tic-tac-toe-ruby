require "board_presenter"

describe BoardPresenter do
  it "presents board" do
    output = StringIO.new
    console = Console.new(output)
    grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    board = Board.new(grid)
    board_presenter = BoardPresenter.new(console)
    board_presenter.present_board(board)
    expect(output.string).to eql(" 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n")
  end
end
