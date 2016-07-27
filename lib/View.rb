require 'tk'

class View
  def initialize
    @root = TkRoot.new do
      minsize 500,500
    end
    @canvas = TkCanvas.new(
      parent: @root,
      'height' => 900,
      'width' => 1000,
      'background'=>'#CCCCCC'
    ) { pack }
  end

  def new_grid_line(key)
    args = key.flatten.map &to_pixel
    TkcLine.new(@canvas, *args)
  end

  def new_line(start, finish)
    TkcLine.new(@canvas, *([start[0], start[1], finish[0], finish[1]].map &to_pixel))
  end

  def new_hoshi(center_x, center_y)
    center_pixel = [center_x, center_y].map &to_pixel
    top_left = center_pixel.map {|c| c-2}
    bottom_right = center_pixel.map {|c| c+2}
    TkcRectangle.new(@canvas, *top_left, *bottom_right).tap {|o| o.configure('fill' => "black")}
  end

  def mainloop
    @root.mainloop
  end

  def to_pixel
    Proc.new {|e| e*45}
  end
end
