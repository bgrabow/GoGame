class GoBoard
  attr_reader :size
  
  def initialize(size = 19)
    @size = parse_size(size)
  end

  private def parse_size(size)
    if [9,13,19].include? size
    return size
    else
      fail ArgumentError.new("Supported sizes include 9, 13, & 19")
    end
  end
  
  def contents(x, y)
    :empty
  end
end