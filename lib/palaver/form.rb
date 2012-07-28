# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

require 'palaver/baseform.rb'

module Palaver

  class Form < Palaver::BaseForm
    def initialize(options)
      super("form", options)
    end
  end
  
end

