# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Conversation
  class DialogFactory
    def calendar(options={},&spec)
      c = Calendar.new(options)
      c.instance_eval &spec if spec
      return c
    end

    def checklist(options={}, &spec)
      c = Checklist.new(options)
      c.instance_eval &spec if spec
      return c
    end

    def radiolist(options={}, &spec)
      c = Radiolist.new(options)
      c.instance_eval &spec if spec
      return c
    end

    def menu(options={}, &spec)
      c = Menu.new(options)
      c.instance_eval &spec if spec
      return c
    end

    def yesno(options={}, &spec)
      yn = YesNo.new(options)
      yn.instance_eval &spec if spec
      return yn
    end

    def textbox(options={}, &spec)
      tb = TextBox.new(options)
      tb.instance_eval &spec if spec
      return tv
    end

    def msgbox(options={}, &spec)
      mb = MsgBox.new(options)
      mb.instance_eval &spec if spec
      return mb
    end
  end
end
