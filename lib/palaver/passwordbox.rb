# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Palaver
  class PasswordBox < Palaver::Base
    def initialize(options)
      super(options)
    end

    def show
      answer = nil
      with_tempfile do |fname|
        cmd = "dialog #@common_options --passwordbox '#@text' #@height #@width 2> #{fname}"
        success = system cmd
        if success  then
          answer = File.read(fname)
        end
      end
      return answer      
    end
  end
end
