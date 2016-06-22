require_relative 'GoBoard'

def display_board(board_model)
  Shoes.app do
    stroke black
    origin = [20, 20]

    #Grid lines
    (0..18).each do |ix|
      y = origin[1] + ix * 20
      line(x_pos(0), y_pos(ix), x_pos(18), y_pos(ix))

      x = origin[0] + ix * 20
      line(x_pos(ix), y_pos(0), x_pos(ix), y_pos(18))
    end

    #Hoshi (star points)
    stroke black
    fill black
    [3,9,15].each do |x|
      [3,9,15].each do |y|
        rect({
          top: y_pos(y),
          left: x_pos(x),
          width: 4,
          height: 4,
          center: true
        })
      end
    end

    board_model.each do |piece|
      color = black
      color = white if piece[:color] == :white
      display_piece(piece[:x], piece[:y], color)
    end
    display_piece(2, 3, white)
    display_piece(3, 4, black)
  end
end

def x_pos(x_ix)
  x_ix * 20 + 20
end

def y_pos(y_ix)
  y_ix * 20 + 20
end

def display_piece(x_ix, y_ix, color)
  stroke black
  fill color
  oval({
    top: y_pos(x_ix),
    left: x_pos(y_ix),
    width: 17,
    height: 17,
    center: true
  })
end

@board = GoBoard.new
@board.put(10, 13, :black)
@board.put(11,12, :white)
display_board(@board)