# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

require 'tempfile'
require 'date'
require 'palaver/base'

module Palaver
  class Calendar < Palaver::Base
    def initialize(options={})
      super(options)
      @default_date = nil

      options.each do |option,value|
        case option
        when :date then self.date(value)
        end
      end
      
    end
    
    def date(d)
      @default_date = d
    end

    def show
      day, month, year =
        if @default_date then [ @default_date.day, @default_date.month, @default_date.year]
        else [ 0, 0, 0 ]
        end
      chosen_date = nil
      with_tempfile do |tfpath|
        cmd = "dialog #@common_options --calendar '%s' %d %d %d %d %d 2> %s" % [ @text,
                                                                                 @height, @width, 
                                                                                 day, month, year,
                                                                                 tfpath ]
        success = system cmd
        chosen_date = Date.strptime(File.read(tfpath), "%d/%m/%Y") if success
      end
      return chosen_date
    end
  end
end
