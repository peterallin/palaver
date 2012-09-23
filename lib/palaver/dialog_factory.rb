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
      :passwordform => PasswordForm,
      :gauge => Gauge,
      :programbox => ProgramBox
    }

    def initialize(*options)
      options.each do |option|
        case option
        when :insecure then @insecure = true
        when :ascii_lines then @ascii_lines = true
        when :no_lines then @no_lines = true
        end

        if option.class == Hash then
          option.each do |k,v|
            case k
              when :aspect then @aspect = v
              when :backtitle then @backtitle = v
              when :begin then @begin = v
              when :cancel_label then @cancel_label = v
            end
          end
        end
      end
    end

    def common_options
      options = []
      options.push("--insecure") if @insecure
      options.push("--ascii-lines") if @ascii_lines
      options.push("--no-lines") if @no_lines
      options.push("--aspect #@aspect") if @aspect
      options.push("--backtitle '#@backtitle'") if @backtitle
      options.push("--begin #{@begin[0]} #{@begin[1]}") if @begin
      options.push("--cancel-label '#@cancel_label'") if @cancel_label
      return options.join(" ")
    end
    
    private

    def method_missing(methodsym, *args, &block)
      if @@dialog_types.has_key? methodsym then
        c = @@dialog_types[methodsym]
        options = args.size == 1 ? args[0] : {}
        options[:common_options] = common_options
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
