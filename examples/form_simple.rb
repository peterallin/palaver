require 'palaver'

dialog_factory = Palaver::DialogFactory.new

answers = dialog_factory.form {
  text "Simple-entry foos and their texts"
  height 10
  form_height 5
  simple_display_width 30
  simple_text_length 200
  simple_entry :first, "First foo", "Default text for first foo"
  simple_entry :second, "Second foo", "Default text for second foo"
  simple_entry :third, "Third foo", "Default text for third foo"
}.show

answers.keys.each do |k|
  puts "#{k}: #{answers[k]}"
end
