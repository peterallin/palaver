require 'conversation'

dialog_factory = Conversation::DialogFactory.new

# How to view a file in a dialog using the hash API
dialog_factory.textbox(:filename => ARGV[0]).show

# How to view a file in a dialog using the block API, does not make much sense
dialog_factory.textbox { filename ARGV[1] }.show
