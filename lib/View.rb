require 'tk'

class View
  def initialize
    @root = TkRoot.new do
      minsize 500,500
    end
    @canvas = TkCanvas.new(
      parent: @root,
      'height' => 500,
      'width' => 500,
      'background'=>'#CCCCCC'
    ) { pack }
  end

  def new_grid_line(key)
    args = key.flatten.map &to_pixel
    TkcLine.new(@canvas, *args)
  end

  def new_hoshi(center)
    center_pixel = center.map &to_pixel
    top_left = center_pixel.map {|c| c-2}
    bottom_right = center_pixel.map {|c| c+2}
    TkcRectangle.new(@canvas, *top_left, *bottom_right).tap {|o| o.configure('fill' => "black")}
    #TkcRectangle.new(@canvas, 1, 1, 20, 20).tap {|o| o.configure('fill' => "black")}
  end

  def mainloop
    @root.mainloop
  end

  def to_pixel
    Proc.new {|e| e*45}
  end
end
