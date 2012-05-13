# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

require 'conversation/pathselect'

module Conversation
  class FSelect < Conversation::PathSelect
    def initialize(options={})
      super(options)
    end

    def dialog_name
      "fselect"
    end
  end
end

