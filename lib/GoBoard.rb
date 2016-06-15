class GoBoard
  attr_reader :size
  def initialize(size = 19)
    @size = parseSize(size)
  end

  def parseSize(size)
    if [9,13,19].include? size
    return size
    else
      fail ArgumentError.new("Supported sizes include 9, 13, & 19")
    return 19
    end
  end
end