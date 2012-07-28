require 'palaver'

dialog_factory =
  if ARGV[0] == "secure" then
    Palaver::DialogFactory.new
  else
    Palaver::DialogFactory.new(:insecure)
  end

# Using the hash based API to ask for a password
hash_pw = dialog_factory.passwordbox(:text => "Please enter password, hash style").show
# Using the block based API to ask for a password
block_pw = dialog_factory.passwordbox{ text "Please enter password, block style" }.show

puts "Hash password: #{hash_pw}"
puts "Block password: #{block_pw}"

