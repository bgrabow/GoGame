require_relative "../lib/Display"

describe "Display" do
  it "creates a grid" do
    display = Display.new(size: 9)
    expect(display.grid[[[1,1],[1,9]]].class).to be(GridLine)
  end

  it "has grid keys that look like this" do
    display = Display.new(size: 3)
    expect(display.grid.keys).to eq([
      [[1,1],[3,1]],
      [[1,2],[3,2]],
      [[1,3],[3,3]],
      [[1,1],[1,3]],
      [[2,1],[2,3]],
      [[3,1],[3,3]]
    ])
  end

  it "contains persistent GridLine objects instead of ad hoc default objects" do
    display = Display.new(size: 9)
    obj1 = display.grid[[[1,1],[1,9]]]
    obj2 = display.grid[[[1,1],[1,9]]]
    expect(obj1).to be(obj2)
    expect(obj1.class).to be(GridLine)
  end
  
  it "doesn't create GridLines out of bounds" do
    display = Display.new(size: 9)
    expect(display.grid[[[0,1],[0,9]]]).to eq(nil)
  end

  context "for a 9x9 board" do
    it "creates Hoshi points at 3,3 and 5,5" do
      display = Display.new(size: 9)
      expect(display.hoshi.keys).to eq([
        [3,3],
        [3,7],
        [7,3],
        [7,7],
        [5,5]
      ])
    end
  end
end
