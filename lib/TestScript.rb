require_relative 'View'
require_relative 'Presenter'

view = View.new
display = Presentation::Presenter.new(size: 19, view: view)
view.mainloop
