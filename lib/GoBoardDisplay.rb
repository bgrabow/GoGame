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

  def change_label
    @label.configure('text' => 'Goodbye world')
  end

  def mainloop
    Tk.mainloop
  end
end
