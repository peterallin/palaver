require 'palaver'

dialog_factory = Palaver::DialogFactory.new

chosen1 = dialog_factory.menu(:text => "Choose from the menu, hash style",
                              :options => [
                                           [ "fisk", "A confusing choice for a metasyntactic variable name", :off ],
                                           [ "foo", "The classic first metasyntactic variable name", :on ],
                                           [ "bar", "The classic second metasyntactic variable name", :off ],
                                           [ "baz", "The classic third metasyntactic variable name", :off ],
                                           [ "quux", "A quite unusual metasyntactic variable name", :off ]
                                          ]).show

chosen2 = dialog_factory.menu {
  text "Choose from the menu, block style"
  option "fisk", "A confusing choice for a metasyntactic variable name"
  option "foo", "The classic first metasyntactic variable name", :on
  option "bar", "The classic second metasyntactic variable name", :on
  option "baz", "The classic third metasyntactic variable name", :on
  option "quux", "A quite unusual metasyntactic variable name"
}.show

puts "Chosen from the dialog created with the hash style:"
puts chosen1
puts
puts "Chosen from the dialog created with the block style"
puts chosen2

