require_relative 'View'
require_relative 'Display'

view = View.new
display = Display.new(size: 9, view: view)
view.mainloop
