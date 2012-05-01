# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Conversation
  class MsgBox < Conversation::Base
    def initialize(options)
      super options
    end

    def show
      cmd = "dialog --msgbox '#@text' #@height #@width"
      system cmd
    end    
  end
end