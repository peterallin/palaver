require 'conversation/list_with_options'

module Conversation
  class Checklist < Conversation::ListWithOptions
    def initialize(options)
      super(options)
    end
    
    def show
      choices = nil
      with_tempfile do |fname|
        cmd = "dialog --checklist '#@text' #@height #@width #@list_height #{options_string_with_status} 2> #{fname}"
        success = system cmd
        if success then
          choices = File.read(fname).split(" ").map { |s| s[1..-2] }
        end
      end
      return choices
    end
  end
end
