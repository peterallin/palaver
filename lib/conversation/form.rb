# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Conversation

  class Form < Conversation::Base
    def initialize(options)
      super(options)
      @entries = []
      @form_height = nil
      @simple_display_width = nil
      @simple_text_length = nil
    end

    def show
      cmd_intro = "dialog --form '#@text' #@height #@width #@form_height "
      cmd_entries = @entries.map { |e| e.to_cmd_s }.join(' ')

      result = nil
      with_tempfile do |tfpath|
        cmd = "#{cmd_intro} #{cmd_entries} 2> #{tfpath}"
        success = system cmd
        result = read_dialog_output tfpath
      end
      
      return result
    end

    private

    class Entry
      attr_reader :field_id
      
      def initialize(id, text, text_y, text_x, default_value, value_y, value_x, field_length, input_length)
        @field_id = id
        @text = text
        @text_y = text_y
        @text_x = text_x
        @default_value = default_value
        @value_y = value_y
        @value_x = value_x
        @field_length = field_length
        @input_length = input_length
      end

      def to_cmd_s
        "'#@text' #@text_y #@text_x '#@default_value' #@value_y #@value_x #@field_length #@input_length"
      end
    end

    def read_dialog_output(fname)
      lines = File.read(fname).split("\n")
      result = {}
      lines.each_with_index { |l,i| result[@entries[i].field_id] = l }
      return result
    end
     
    def form_height(val)
      @form_height = val
    end

    def entry(id, title, text_y, text_x, default_value, value_y, value_x, field_length, input_length)
      newentry = Entry.new(id, title, text_y, text_x, default_value, value_y, value_x, field_length, input_length)
      @entries.push newentry
    end

  end
  
end

