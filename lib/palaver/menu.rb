# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

require 'palaver/list_with_options'

module Palaver
  class Menu < Palaver::ListWithOptions
    def initialize(options)
      super options
    end

    def show
      chosen = nil
      with_tempfile do |fname|
        cmd = "dialog --menu '#@text' #@height #@width #@list_height #{options_string_no_status} 2> #{fname}"
        sucess = system cmd
        if sucess then
          chosen = File.read(fname)
        end
      end
      return chosen
    end
    
  end
end
