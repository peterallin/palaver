require 'conversation'

dialog_factory = Conversation::DialogFactory.new

chosen1 = dialog_factory.radiolist(:text => "Choose one, hash style",
                                   :options => [
                                                [ "fisk", "A confusing choice for a metasyntactic variable name", :off ],
                                                [ "foo", "The classic first metasyntactic variable name", :on ],
                                                [ "bar", "The classic second metasyntactic variable name", :off ],
                                                [ "baz", "The classic third metasyntactic variable name", :off ],
                                                [ "quux", "A quite unusual metasyntactic variable name", :off ]
                                               ]).show

chosen2 = dialog_factory.radiolist {
  text "Choose one, block style"
  option "fisk", "A confusing choice for a metasyntactic variable name"
  option "foo", "The classic first metasyntactic variable name", :on
  option "bar", "The classic second metasyntactic variable name"
  option "baz", "The classic third metasyntactic variable name"
  option "quux", "A quite unusual metasyntactic variable name"
}.show

puts "Chosen from the dialog created with the hash style:"
puts chosen1
puts
puts "Chosen from the dialog created with the block style"
puts chosen2

