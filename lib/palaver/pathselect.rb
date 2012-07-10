# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Palaver
  class PathSelect < Palaver::Base
    def initialize(options={})
      super(options)
      @path = nil
      
      options.each do |option,value|
        case option
        when :path  then self.path(value)
        end
      end
      
    end

    def path(str)
      @path = str
    end

    def show
      raise "CAn't open a #{dialog_name} dialog with a path" if not @path
      chosen_file = nil
      with_tempfile do |tfpath|
        cmd = "dialog --#{dialog_name} '#@path' #@height #@width 2> #{tfpath}"
        puts cmd
        success = system cmd
        chosen_file = File.read(tfpath) if success
      end
      return chosen_file
    end
  end
end

