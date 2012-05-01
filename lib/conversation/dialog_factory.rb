# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Conversation
  class DialogFactory
    def calendar(options={},&spec)
      make_dialog(Calendar, options, &spec)
    end

    def checklist(options={}, &spec)
      make_dialog(Checklist, options, &spec)
    end

    def radiolist(options={}, &spec)
      make_dialog(Radiolist, options, &spec)
    end

    def menu(options={}, &spec)
      make_dialog(Menu, options, &spec)
    end

    def yesno(options={}, &spec)
      make_dialog(YesNo, options, &spec)
    end

    def textbox(options={}, &spec)
      make_dialog(TextBox, options, &spec)
    end

    def msgbox(options={}, &spec)
      make_dialog(MsgBox, options, &spec)
    end

    def inputbox(options={}, &spec)
      make_dialog(InputBox, options, &spec)
    end

    def infobox(options={}, &spec)
      make_dialog(InfoBox, options, &spec)
    end

    private

    def make_dialog(cls, options, &spec)
      d = cls.new(options)
      d.instance_eval &spec if spec
      return d
    end
    
  end
end
