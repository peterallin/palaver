# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

require 'conversation/list_with_options'

module Conversation
  class Checklist < Conversation::ListWithOptions
    def initialize(options)
      super(options)
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
