# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Palaver
  class Gauge < Palaver::Base

    def initialize(options)
      @inital_percentage = 0
      super(options)
    end

    def show
      cmd = "dialog #@common_options --gauge '#@text' #@height #@width #@inital_percentage"
      @pipe = IO.popen(cmd,"w")
    end

    def percentage(p)
      if @pipe then
        @pipe.puts p
      else
        @inital_percentage = p
      end
    end

    def close
      @pipe.close
    end
    
    private
    
    def inital_percentage(percentage)
      @inital_percentage = percentage
    end
  end
end
