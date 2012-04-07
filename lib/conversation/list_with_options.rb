module Conversation
  class ListWithOptions < Conversation::Base
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
    
  end
end
