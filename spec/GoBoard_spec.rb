require 'GoBoard'

describe GoBoard do
  it "is_defined" do
    expect {board = GoBoard.new}.not_to raise_error
  end
end