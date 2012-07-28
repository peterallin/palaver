# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Palaver
  class PasswordForm < Palaver::BaseForm
    def initialize(options)
      super("passwordform", options)
    end
  end
end
