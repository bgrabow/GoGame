require_relative 'View'
require_relative 'Presenter'

view = View.new
display = Presenter.new(size: 9, view: view)
view.mainloop
