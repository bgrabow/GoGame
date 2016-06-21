require_relative '../lib/GoBoard'

describe "Creating a Go Board" do
  it "is defined" do
    expect {board = GoBoard.new}.not_to raise_error
  end

  it "can be created with default size" do
    board = GoBoard.new
    expect(board.size).to be 19
  end

  it "can be created with a small size" do
    board = GoBoard.new(9)
    expect(board.size).to be 9
  end

  it "can be created with a medium size" do
    board = GoBoard.new(13)
    expect(board.size).to be 13
  end

  it "can be created with a large size" do
    board = GoBoard.new(19)
    expect(board.size).to be 19
  end

  it "fails when given any other size" do
    begin
      board = GoBoard.new(10)
    rescue StandardError => ex
    end
    expect(ex.class).to be (ArgumentError)
    expect(ex.message).to eq("Supported sizes include 9, 13, & 19")
  end
end

describe "Board contents" do
  before(:example) do
    @board = GoBoard.new
  end
  
  it "are initially empty" do
    expect(@board.contents(1, 1)).to eq(:empty)
    expect(@board.contents(@board.size, @board.size)).to eq(:empty)
  end
  
  it "are nil when out of bounds" do
    expect(@board.contents(0, 0)).to eq(nil)
  end
  
  it "has contents :black when given :black" do
    @board.put(1, 1, :black)
    expect(@board.contents(1,1)).to eq(:black)
  end
  
  it "has contents :white when given :white" do
    @board.put(1, 1, :white)
    expect(@board.contents(1,1)).to eq(:white)
  end
  
  it "doesn't change contents when a piece is placed out of bounds" do
    @board.put(0, 0, :black)
    @board.put(@board.size + 1, @board.size + 1, :white)
    expect(@board.contents(0, 0)).to eq(nil)
    expect(@board.contents(@board.size + 1, @board.size + 1)).to eq(nil)
  end
  
  it "returns previous value when given a new value" do
    @board.put(1, 1, :white)
    expect(@board.put(1, 1, :black)).to eq(:white)
  end
end
