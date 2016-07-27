class Presenter
  def initialize(size:, view:)
    @goban = ViewModel::Goban.new(
      size: size, 
      new_line: lambda {|start, finish| view.new_line(start, finish)},
      new_hoshi: lambda {|center| view.new_hoshi(center)}
    )
    @size = size
    @view = view
    @goban.draw
  end

end

module ViewModel
end

class ViewModel::Goban
  def initialize(size:, new_line:, new_hoshi:)
    @size = size
    @new_line = new_line
    @new_hoshi = new_hoshi
  end

  def draw
    draw_grid
    draw_hoshi
  end

  def draw_grid
    (1..@size).each do |i|
      @new_line.([1, i], [@size, i])
      @new_line.([i, 1], [i, @size])
    end
  end

  def draw_hoshi
    hoshi_coords(@size).each do |point|
      @new_hoshi.(point)
    end
  end

  def hoshi_coords(size)
    case size
    when 9
      [[3,3],[3,7],[7,3],[7,7],[5,5]]
    when 13
      [[4,4],[4,10],[10,4],[10,10],[7,7]]
    when 19
      [[ 4,4],[ 4,10],[ 4,16],
       [10,4],[10,10],[10,16],
       [16,4],[16,10],[16,16]]
    end
  end
end 
