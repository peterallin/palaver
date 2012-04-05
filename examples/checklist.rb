require 'conversation'

dialog_factory = Conversation::DialogFactory.new
chosen = dialog_factory.checklist {
  text "Which do you want?"
  option "fisk", "A confusing choice for a metasyntactic variable name"
  option "foo", "The classic first metasyntactic variable name", :on
  option "bar", "The classic second metasyntactic variable name"
  option "baz", "The classic third metasyntactic variable name"
  option "quux", "A quite unusual metasyntactic variable name"
}.show

puts chosen

