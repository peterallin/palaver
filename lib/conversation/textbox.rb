# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Conversation
  class TextBox < Base
    def initialize(options)
      super options
      options.each do |option,value|
        case option
        when :filename then filename(value)
        end
      end
    end
    
    def show
      cmd = "dialog --textbox '#@filename' #@height #@width"
      system cmd
    end
    
    def filename(name)
      @filename = name
    end
  end
end

