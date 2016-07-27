require 'lib/View'
require 'lib/Presentation/Presenter'

view = View.new
display = Presentation::Presenter.new(size: 19, view: view)
view.mainloop
