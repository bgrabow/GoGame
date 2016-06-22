require_relative '../lib/GoBoardDisplay'

describe "GoBoardDisplay" do
  it "can be instantiated" do
    expect {display = GoBoardDisplay.new(Object.new)}.not_to raise_error
  end
  
  it "accepts a GoBoard init param" do
    expect {display = GoBoardDisplay.new(Object.new)}.not_to raise_error
  end
  
  
end