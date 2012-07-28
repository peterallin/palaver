# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Palaver
  attr_reader :common_options
  
  class Base
    def initialize(options)
      @text = nil
      @width = 0
      @height = 0

      options.each do |option,value|
        case option
        when :common_options then @common_options = value
        when :width then self.width(value)
        when :height then self.height(value)
        when :text then self.text(value)
        end
      end
    end

    def text(str)
      @text = str
    end
    
    def width(w)
      @width = w
    end

    def height(h)
      @height = h
    end

    def with_tempfile
      tf = Tempfile.new "palaver"
      tfpath = tf.path
      tf.close
      yield tfpath
      File.delete tfpath
    end
  end
end
