require 'conversation/list_with_options'

module Conversation
  class Radiolist < Conversation::ListWithOptions
    def initialize(options)
      super(options)
    end
    
    def show
      chosen = nil
      with_tempfile do |fname|
        cmd = "dialog --radiolist '#@text' #@height #@width #@list_height #{@dialog_options.join ' '} 2> #{fname}"
        sucess = system cmd
        if sucess then
          chosen = File.read(fname)
        end
      end
      return chosen
    end
  end
end
