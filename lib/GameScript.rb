require_relative 'GoBoardDisplay'

class GoController
  def hello
    puts "Hello"
  end

  def initialize
    display = GoBoardDisplay.new(context: self)
    display.show_board
    display.mainloop
  end

  def alert
    puts "Hello"
  end
end

controller = GoController.new
