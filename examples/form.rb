require 'palaver'

dialog_factory = Palaver::DialogFactory.new

answers = dialog_factory.form {
  text "Foos and their texts"
  height 10
  form_height 5
  entry :first, "First foo", 1, 0, "Default text for first foo", 1, 15, 20, 200
  entry :second, "Second foo", 1, 40, "Default text for second foo", 1, 55, 20, 200
  entry :third, "Third foo", 3, 0, "Default text for third foo", 3, 15, 20, 200
}.show

answers.keys.each do |k|
  puts "#{k}: #{answers[k]}"
end
