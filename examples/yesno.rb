require 'palaver'

dialog_factory = Palaver::DialogFactory.new(:aspect => 40)

# Using the hash based API, which makes most sense for this kind of dialog
likes_hash_based_api = dialog_factory.yesno(:text => "Do you like the hash based API?").show

# Using the block based API
likes_block_based_api = dialog_factory.yesno { text "Do you like the block based API?" }.show

if likes_block_based_api or likes_hash_based_api then
  puts "Great"
else
  puts "What a pity. Try RDialog instead, it's also very nice"
end
