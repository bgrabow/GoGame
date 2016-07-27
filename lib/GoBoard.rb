class GoBoard
  include Enumerable
  
  attr_reader :size
  def initialize(size = 19)
    @size = parse_size(size)
    @board = Hash.new do |h, k|
      if on_board?(k[0],k[1])
        :empty
      else
        nil
      end
    end
  end

  private def parse_size(size)
    if [9,13,19].include?(size)
      return size
    else
      fail ArgumentError.new("Supported sizes include 9, 13, & 19")
    end
  end

  def contents(x, y)
    return @board[[x, y]]
  end

  def put(x, y, piece)
    if on_board?(x, y)
      old_piece = @board[[x, y]]
      @board[[x, y]] = piece
      old_piece
    end
  end
  
  def on_board?(x, y)
    return (1..self.size).include?(x) && (1..self.size).include?(y)
  end
  
  def each
    @board.each_key do |k|
      point = {
        x: k[0],
        y: k[1],
        color: @board[k]
      }
      yield point
    end
  end
end
