require 'palaver'

dialog_factory = Palaver::DialogFactory.new

# Using the hash based API for requesting the user to choose a directory
dir_hash = dialog_factory.dselect(:path => "/").show

# Using the block based API for requesting the user to choose a directory
dir_block = dialog_factory.dselect { path "/" }.show

puts "Dir chosen with hash method #{dir_hash}"
puts "Dir chosen with block method #{dir_block}"

