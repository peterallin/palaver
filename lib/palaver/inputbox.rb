# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Palaver
  class InputBox < Palaver::Base
    def initialize(options)
      super(options)
      @initial = nil

      options.each do |option,value|
        case option
        when :initial then self.initial(value)
        end
      end

    end

    def initial(text)
      @initial = text
    end

    def show
      answer = nil
      with_tempfile do |fname|
        cmd = "dialog #@common_options --inputbox '#@text' #@height #@width '#@initial' 2> #{fname}"
        success = system cmd
        if success  then
          answer = File.read(fname)
        end
      end
      return answer
    end
  end
end
