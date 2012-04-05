require 'tempfile'
require 'conversation/base'

module Conversation
  class Calendar < Conversation::Base
    def initialize
      super
      @text = nil
      @default_date = nil
    end
    
    def date(d)
      @default_date = d
    end

    def show
      day, month, year =
        if @default_date then [ @default_date.day, @default_date.month, @default_date.year]
        else [ 0, 0, 0 ]
        end
      
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

