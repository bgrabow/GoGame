require_relative "Goban"

module Presentation
  class Presenter
    def initialize(size:, view:)
      @goban = Goban.new(
        size: size, 
        new_line: lambda {|start, finish| view.new_line(start, finish)},
        new_hoshi: lambda {|center| view.new_hoshi(center)}
      )
      @size = size
      @view = view
      @goban.draw
    end
  end
end

