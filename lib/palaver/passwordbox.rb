# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Palaver
  class PasswordBox < Palaver::Base
    def initialize(options)
      super(options)
      @insecure = false

      options.each do |option,value|
        case option
        when :insecure then self.insecure(value)
        end
      end
    end

    def insecure(should_be_insecure=true)
      @insecure = should_be_insecure
    end

    
    def show
      answer = nil
      with_tempfile do |fname|
        insecure = @insecure ? "--insecure" : ""
        cmd = "dialog #{insecure} --passwordbox '#@text' #@height #@width 2> #{fname}"
        success = system cmd
        if success  then
          answer = File.read(fname)
        end
      end
      return answer      
    end
  end
end
