module Conversation
  class Checklist < Conversation::Base
    def initialize
      @options = []
    end
  
    def option(tag, desc, check=nil)
      state = check == :on ? "on" : "off"
      @options.push '"#{tag}" "#{desc}" #{state}'
    end
  end
end
