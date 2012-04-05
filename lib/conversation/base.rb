module Conversation
  class Base
    def initialize
      @text = nil
      @width = 0
      @height = 0
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

    def with_tempfile
      tf = Tempfile.new "conversation"
      tfpath = tf.path
      tf.close
      yield tfpath
      File.delete tfpath
    end
  end
end
