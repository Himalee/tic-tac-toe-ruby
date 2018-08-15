require "console"

describe Console do

  before :each do
    @output = StringIO.new
  end

  it "prints hello" do
    input = StringIO.new
    console = Console.new(@output, input)
    console.present("hello\n")
    expect(@output.string).to eql("hello\n")
  end
end
