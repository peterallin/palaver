require 'palaver'

dialog_factory = Palaver::DialogFactory.new

answers = dialog_factory.passwordform {
  text "Foos and their secret texts"
  height 10
  form_height 5
  entry :first, "First foo", 1, 0, "", 1, 15, 20, 200
  entry :second, "Second foo", 1, 40, "", 1, 55, 20, 200
  entry :third, "Third foo", 3, 0, "", 3, 15, 20, 200
}.show

answers.keys.each do |k|
  puts "#{k}: #{answers[k]}"
end
