require 'conversation'

dialog_factory = Conversation::DialogFactory.new

# Using the hash based API to ask for a password
hash_pw = dialog_factory.passwordbox(:text => "Please enter password, hash style").show
hash_pw_insec = dialog_factory.passwordbox(:text => "Please enter password, more usable hash style", :insecure => true).show
# Using the block based API to ask for a password
block_pw = dialog_factory.passwordbox{ text "Please enter passwrod, block style" }.show
block_pw_insec = dialog_factory.passwordbox{ insecure; text "Please enter passwrod, more usable block style" }.show

puts "Hash password: #{hash_pw}"
puts "Hash password (entered in less secure way): #{hash_pw_insec}"
puts "Block password: #{block_pw}"
puts "Block parssword (entered ien less secure way): #{block_pw_insec}"

