require 'tempfile'

module Conversation
  class Calendar
    def initialize
      @text = nil
      @width = nil
      @height = nil
      @default_date = nil
    end
    
    def text(str)
      @text = str
    end

    def date(d)
      @default_date = d
    end

    def width(w)
      @width = w
    end

    def height(h)
      @height = h
    end

    def show
      day, month, year =
        if @default_date then [ @default_date.day, @default_date.month, @default_date.year]
        else [ 0, 0, 0 ]
        end
      width = @width ? @width : 0
      height = @height ? @height : 0
      
      tf = Tempfile.new("conversation")
      tfpath = tf.path
      tf.close
      cmd = 'dialog --calendar "%s" %d %d %d %d %d 2> %s' % [ @text,
                                                              height, width, 
                                                              day, month, year,
                                                              tfpath ]
      success = system cmd
      if success then
        chosen_date = Date.strptime(File.read(tfpath), "%d/%m/%Y")
        return chosen_date
      else
        return nil
      end
    end
  end
end

