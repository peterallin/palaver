module Conversation

  class ListWithOptions < Conversation::Base

    class Option
      attr_reader :tag, :item, :status
      def initialize(tag,item,status=nil)
        @tag = tag
        @item = item
        @status = status
      end
    end

    def initialize(options)
      super(options)
      @dialog_options = []
      @list_height = 0

      options.each do |option,value|
        case option
        when :options then @dialog_options = value.map { |o| Option.new(o[0],o[1],o[2]) }
        end
      end
    end
  
    def option(tag, desc, status=nil)
      @dialog_options.push Option.new(tag,desc,status)
    end

    def list_height(h)
      @list_height = h
    end

    def options_string_with_status
      @dialog_options.map { |o| "'#{o.tag}' '#{o.item}' '#{o.status == :on ? 'on' : 'off'}'" }.join ' '
    end


    
  end
end
