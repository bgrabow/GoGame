require 'tk'

class GoBoardDisplay
  def initialize(context)
    @context = context
    @root = TkRoot.new do
      title "Go"
      minsize(500, 400)
    end

    @label = TkLabel.new(@root) { pack }
    @label.configure('text' => 'Hello world')

    @button = TkButton.new(@root) { pack }
    @button.configure('text' => 'Alert')
    @button.command { context.alert }
  end

  def show_board
    @canvas ||= new_canvas
    @horizontal_lines = [] 
    (1..19).each_with_index do |y|
      @horizontal_lines << TkcLine.new(@canvas, 10, y*20, 90, y*20)
    end
  end

  def new_canvas
    canvas = TkCanvas.new('height' => 600, 'width' => 600, 'background' => "#CCCCCC") { pack }
  end


  def show_menu
  end

  def change_label
    @label.configure('text' => 'Goodbye world')
  end

  def mainloop
    Tk.mainloop
  end
end
