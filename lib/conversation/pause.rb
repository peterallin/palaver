# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Conversation
  class Pause < Conversation::Base
    def initialize(options)
      super(options)
      @seconds = 0
      options.each do |option,value|
        case option
        when :seconds then @seconds = value
        end
      end
    end

    def seconds(val)
      @seconds = val
    end

    def show
      cmd = "dialog --pause '#@text' #@height #@width #@seconds"
      rc = system cmd
      return rc
    end
  end
end
