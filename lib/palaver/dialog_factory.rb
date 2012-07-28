# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Palaver
  class DialogFactory
    @@dialog_types = {
      :calendar => Calendar,
      :checklist => Checklist,
      :radiolist => Radiolist,
      :menu => Menu,
      :yesno => YesNo,
      :textbox => TextBox,
      :msgbox => MsgBox,
      :inputbox => InputBox,
      :infobox => InfoBox,
      :pause => Pause,
      :passwordbox => PasswordBox,
      :dselect => DSelect,
      :fselect => FSelect,
      :form => Form,
      :passwordform => PasswordForm
    }

    private

    def method_missing(methodsym, *args, &block)
      if @@dialog_types.has_key? methodsym then
        c = @@dialog_types[methodsym]
        options = args.size == 1 ? args[0] : {}
        return make_dialog(c, options, &block)
      else
        raise NoMethodError.new("Undefined method: #{methodsym} for #{self}", methodsym)
      end
    end

    def make_dialog(cls, options, &spec)
      d = cls.new(options)
      d.instance_eval &spec if spec
      return d
    end
    
  end
end
