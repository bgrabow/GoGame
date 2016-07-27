require_relative "../lib/Presenter.rb"

describe "Presenter" do
  context "when creating a Presenter" do
  end

  context "when displaying stones" do
    skip "creates new stones the first time" do
      view_spy = spy("view")
      position = [2, 3]
      value = :white
      board = [[position, value]]
      Presenter.new(size: 9, view: view_spy)
      Presenter.display_board(board)
      expect(view_spy).to have_received(:new_stone).with(2, 3, :white)
    end
  end
end

describe "Goban" do

  it "draws the board lines" do
    view = double()
    allow(view).to receive(:new_line)
    size = 9
    goban = ViewModel::Goban.new(size: size,
                         new_line: lambda {|start, finish| view.new_line(start, finish)},
                         new_hoshi: lambda {}
                        )
    goban.draw_grid
    (1..size).each do |line|
      test_new_horizontal_line(line, view)
      test_new_vertical_line(line, view)
    end
  end

  it "draws Hoshi for 9x9 board" do
    view = double()
    allow(view).to receive(:new_hoshi)
    size = 9
    goban = ViewModel::Goban.new(size: size,
                                 new_line: lambda {},
                                 new_hoshi: lambda {|center| view.new_hoshi(center)}
                                )
    goban.draw_hoshi
    [[3,3],[3,7],[7,3],[7,7],[5,5]].each do |point|
      test_create_hoshi(x: point[0], y: point[1], spy: view)
    end
  end

  def test_new_horizontal_line(row, view_spy)
    expect(view_spy).to have_received(:new_line).with([1, row], [9, row])
  end

  def test_new_vertical_line(col, view_spy)
    expect(view_spy).to have_received(:new_line).with([col, 1], [col, 9])
  end

  def test_create_hoshi(x:, y:, spy:)
    expect(spy).to have_received(:new_hoshi).with([x, y])
  end
end
