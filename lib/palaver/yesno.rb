# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Palaver
  class YesNo < Palaver::Base
    def initialize(optons)
      super optons
    end

    def show
      cmd = "dialog --yesno '#@text' #@height #@width"
      rc = system cmd
      return  rc
    end
  end
end
