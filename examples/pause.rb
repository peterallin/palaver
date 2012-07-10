require 'palaver'

dialog_factory = Palaver::DialogFactory.new

accepted_hash_style = dialog_factory.pause(:text => "Pause, hash style", :seconds => 15, :width => 40, :height => 8).show
accepted_block_style = dialog_factory.pause{ text "Pause, block style";  seconds 20; width 30; height 8; }.show

if accepted_hash_style then
  puts "You accepted the hash style pause"
end

if accepted_block_style then
  puts "You accepted the block style pause"
end
