require 'palaver'

early_finish = ARGV[0] ? ARGV[0].to_i : nil

dialog_factory = Palaver::DialogFactory.new(:backtitle => "Waiting for progress")

gauge = dialog_factory.gauge {
  text "Gauge, block style"
  inital_percentage 22
}

gauge.show

(22..100).each do |p|
  if p == early_finish then
    gauge.close
    break
  end
  sleep_duration = p > 98 ? 10 : 0.1
  sleep sleep_duration
  gauge.percentage(p)
end


