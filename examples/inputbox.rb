require 'conversation'

dialog_factory = Conversation::DialogFactory.new

# Using the hash based API for asking a question in an input box
answer_hash = dialog_factory.inputbox(:text => "What do you think about the hash based API?").show

# Using the block based API for asking a question in an input box
answer_block = dialog_factory.inputbox{ text "What do you think about the block based API?" }.show

puts "Answer to the hash question: #{answer_hash}"
puts "Answer to the block question: #{answer_block}"
