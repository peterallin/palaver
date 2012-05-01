require 'conversation'

dialog_factory = Conversation::DialogFactory.new

dialog_factory.infobox(:text => "This is information from the hash based api").show
sleep 2
dialog_factory.infobox(:text => "This is wide information from the hash based api", :width => 60, :height => 10).show
sleep 2

dialog_factory.infobox{ text "This is information from the block based api" }.show
sleep 2
dialog_factory.infobox{ text "This is wide information from the block based api"; width 60; height 10 }.show
sleep 2

