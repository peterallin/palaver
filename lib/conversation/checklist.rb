module Conversation
  class Checklist < Conversation::Base
    def initialize(options)
      super(options)
      @dialog_options = []
      @list_height = 0

      options.each do |option,value|
        case option
        when :options then
          @dialog_options = value.map { |o| "'#{o[0]}' '#{o[1]}' " + ( o[2] == :on ? "on" : "off" ) }
        end
      end
    end
  
    def option(tag, desc, check=nil)
      state = check == :on ? "on" : "off"
      @dialog_options.push "'#{tag}' '#{desc}' #{state}"
    end

    def list_height(h)
      @list_height = h
    end

    def show
      choices = nil
      with_tempfile do |fname|
        cmd = "dialog --checklist '#@text' #@height #@width #@list_height #{@dialog_options.join ' '} 2> #{fname}"
        sucess = system cmd
        if sucess then
          choices = File.read(fname).split(" ").map { |s| s[1..-2] }
        end
      end
      return choices
    end
  end
end
