# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

require 'palaver/pathselect'

module Palaver
  class DSelect < Palaver::PathSelect
    def initialize(options={})
      super(options)
    end

    def dialog_name
      "dselect"
    end
    
  end
end

