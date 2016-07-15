require_relative 'GoBoardDisplay'

class GoController
  def hello
    puts "Hello"
  end

  def initialize
    display = GoBoardDisplay.new(self)
    display.mainloop
  end

  def alert
    puts "Hello"
  end
end

controller = GoController.new
