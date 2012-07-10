require 'palaver'

dialog_factory = Palaver::DialogFactory.new

# Using the hash based API for asking a question in an input box
answer_hash = dialog_factory.inputbox(:text => "What do you think about the hash based API?", :initial => "I like it very much" ).show

# Using the block based API for asking a question in an input box
answer_block = dialog_factory.inputbox{ text "What do you think about the block based API?"; initial "I love it"; }.show

# Using the block based API, with no initial value
answer_ruby = dialog_factory.inputbox { text "What do you think about Ruby? (be creative)" }.show

puts "Answer to the hash question: #{answer_hash}"
puts "Answer to the block question: #{answer_block}"
puts "Answer to the Ruby question: #{answer_ruby}"
