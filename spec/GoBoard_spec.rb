require_relative '../lib/GoBoard'

describe GoBoard do
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