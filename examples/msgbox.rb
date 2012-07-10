require 'palaver'

dialog_factory = Palaver::DialogFactory.new

# Using the hash based API for showing a msgbox
dialog_factory.msgbox(:text => "This is a message from the hash based API").show

# Using the block based API for showing a msgbox
dialog_factory.msgbox { text "This is a message from the block based API" }.show
