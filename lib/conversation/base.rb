module Conversation
  class Base
    def initialize
      @text = nil
      @width = nil
      @height = nil
    end

    def text(str)
      @text = str
    end
    
    def width(w)
      @width = w
    end

    def height(h)
      @height = h
    end

  end
end
