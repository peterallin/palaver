require 'palaver'
require 'date'

dialog_factory = Palaver::DialogFactory.new(:begin => [2,2], :backtitle => "Defaults to a nasty period")

# Using the hash based API with the calendar dialog
start_date = dialog_factory.calendar(:text => "Choose the start date", :date => Date.new(1939,9,1)).show

# Using the block based API with the calendar dialog. This probably doesn'palaver'
# simple widget like the calendar.
end_date = dialog_factory.calendar { text "Choose the end date"; date Date.new(1945,9,2); }.show

puts start_date
puts end_date
