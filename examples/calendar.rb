require 'conversation'
require 'date'

dialog_factory = Conversation::DialogFactory.new
start_date = dialog_factory.calendar { text "Choose the start date"; date Date.new(1974,8,11); }.show
puts start_date
