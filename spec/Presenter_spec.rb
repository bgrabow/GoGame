require_relative "../lib/Presentation/Presenter.rb"
require_relative "../lib/Presentation/Goban.rb"



describe "Presenter" do
  context "when creating a Presenter" do
    it "delegates to the view" do
      view = double()
      allow(view).to receive(:new_line)
      allow(view).to receive(:new_hoshi)
      presenter = Presentation::Presenter.new(size: 9, view: view)
    end
  end
end

describe "Goban" do

  it "draws the board lines" do
    view = double()
    allow(view).to receive(:new_line)
    size = 9
    goban = Presentation::Goban.new(size: size,
                         new_line: lambda {|start, finish| view.new_line(start, finish)},
                         new_hoshi: lambda {}
                        )
    goban.draw_grid
    (1..size).each do |line|
      test_new_horizontal_line(line, view)
      test_new_vertical_line(line, view)
    end
  end

  it "draws Hoshi for 19x19 board" do
    view = double()
    allow(view).to receive(:new_hoshi)
    size = 19
    goban = Presentation::Goban.new(size: size,
                                 new_line: lambda {},
                                 new_hoshi: lambda {|center| view.new_hoshi(center)}
                                )
    goban.draw_hoshi
    Presentation::Goban.hoshi_coords(size).each do |point|
      test_create_hoshi(x: point[0], y: point[1], spy: view)
    end
  end

  it "draws Hoshi for 13x13 board" do
    view = double()
    allow(view).to receive(:new_hoshi)
    size = 13
    goban = Presentation::Goban.new(size: size,
                                 new_line: lambda {},
                                 new_hoshi: lambda {|center| view.new_hoshi(center)}
                                )
    goban.draw_hoshi
    [[4,4],[4,10],[10,4],[10,10],[7,7]].each do |point|
      test_create_hoshi(x: point[0], y: point[1], spy: view)
    end
  end

  it "draws Hoshi for 9x9 board" do
    view = double()
    allow(view).to receive(:new_hoshi)
    size = 9
    goban = Presentation::Goban.new(size: size,
                                 new_line: lambda {},
                                 new_hoshi: lambda {|center| view.new_hoshi(center)}
                                )
    goban.draw_hoshi
    [[3,3],[3,7],[7,3],[7,7],[5,5]].each do |point|
      test_create_hoshi(x: point[0], y: point[1], spy: view)
    end
  end

  def test_new_horizontal_line(row, spy)
    expect(spy).to have_received(:new_line).with([1, row], [9, row])
  end

  def test_new_vertical_line(col, spy)
    expect(spy).to have_received(:new_line).with([col, 1], [col, 9])
  end

  def test_create_hoshi(x:, y:, spy:)
    expect(spy).to have_received(:new_hoshi).with([x, y])
  end
end
