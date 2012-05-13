require 'conversation'

dialog_factory = Conversation::DialogFactory.new

# Using the hash based API for requesting the user to choose a fileectory
file_hash = dialog_factory.fselect(:path => "/", :width => 60, :height => 10).show

# Using the block based API for requesting the user to choose a fileectory
file_block = dialog_factory.fselect { path "/"; width 60; height 10; }.show

puts "File chosen with hash method #{file_hash}"
puts "File chosen with block method #{file_block}"

