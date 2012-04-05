module Conversation
  class Checklist < Conversation::Base
    def initialize
      super
      @options = []
      @list_height = 0
    end
  
    def option(tag, desc, check=nil)
      state = check == :on ? "on" : "off"
      @options.push "'#{tag}' '#{desc}' #{state}"
    end

    def list_height(h)
      @list_height = h
    end

    def show
      choices = nil
      with_tempfile do |fname|
        cmd = "dialog --checklist '#@text' #@height #@width #@list_height #{@options.join ' '} 2> #{fname}"
        sucess = system cmd
        if sucess then
          choices = File.read(fname).split(" ").map { |s| s[1..-2] }
        end
      end
      return choices
    end
  end
end
