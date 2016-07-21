class Display
  attr_reader :grid, :hoshi

  def initialize(size:, view: TestView.new)
    @size = size
    @view = view
    @grid = generate_grid(size: @size)
    @hoshi = generate_hoshi(size: @size)
  end

  def generate_grid(size:)
    space = CoordinateSpace.new(x_range: 1..size, y_range: 1..size)

    horizontal_keys = space.left_edge.zip(space.right_edge)
    vertical_keys = space.top_edge.zip(space.bottom_edge)

    all_keys = horizontal_keys + vertical_keys
    h = Hash.new
    all_keys.each {|k| h[k] = @view.new_grid_line(k) }

    h
  end

  def generate_hoshi(size:)
    h = Hash.new
    hoshi_coords(size: size).each {|point| h[point] = @view.new_hoshi(point)} 
    h
  end

  def hoshi_coords(size:)
    return [
      [3,3],
      [3,7],
      [7,3],
      [7,7],
      [5,5]
    ]

    case size
    when 9
      [
        [3,3],
        [3,7],
        [7,3],
        [7,7],
        [5,5]
      ]
    when 13 
      [
        [4,4],
        [4,10],
        [10,4],
        [10,10],
        [7,7]
      ]
    when 19 
      [
        [4,4],
        [4,10],
        [4,16],
        [10,4],
        [10,10],
        [10,16],
        [16,4],
        [16,10],
        [16,16]
      ]
    else []
    end
  end
end

class TestView
  def new_grid_line(key)
    GridLine.new
  end

  def new_hoshi(key)
  end
end

class GridLine
end

class CoordinateSpace
  def initialize(x_range:, y_range:)
    @x_coords = Array x_range
    @y_coords = Array y_range
  end

  def left_edge
    [@x_coords.first].product(@y_coords)
  end

  def right_edge
    [@x_coords.last].product(@y_coords)
  end

  def top_edge
    @x_coords.product([@y_coords.first])
  end

  def bottom_edge
    @x_coords.product([@y_coords.last])
  end
end
