require 'palaver'

# Run this example from the command line with two arguments: the example to show and the external
# program to run.

hash_style = false

# Specify "hash" from the cmdline to run this.
#
# Shows how to run an external program, showing its output in a dialog box, using the hash based API
def hash_style(factory, cmd)
  factory.programbox(:text => "Running #{cmd} hash style", :command => cmd,
                     :width => 40, :height => 10)
end

# Specify "block_ext" from the cmdline to run this.
#
# Shows how to run an external program, showing its output in a dialog box, using the block based
# api
def block_style_external_command(factory, cmd)
  factory.programbox() {
    text "Running #{cmd} block style"
    command cmd
    height 15
    width 30
  }
end

# Specify "block_block" from the cmdline to run this.
#
# Shows how to run code supplied in a block, showing its output in a dialog box. The command name
# supplied on the cmdline is ignored by this.
def block_style_block(factory, cmd)
  factory.programbox() {
    text "Running code from a block"
    height 15
    width 30
    command {
      puts 'foo block'
      sleep 2
      puts 'bar block'
      sleep 2
      puts 'baz block'
    }
  }
end


examples = {
  'hash' => method(:hash_style),
  'block_ext' => method(:block_style_external_command),
  'block_block' => method(:block_style_block)
}

wanted_example = ARGV[0]
external_program = ARGV[1]

dialog_factory = Palaver::DialogFactory.new()

ex = examples[ARGV[0]]
if ex then
  dialog = ex.call(dialog_factory, ARGV[1])
  dialog.show
else
  puts "Choose one of the following examples: " + examples.keys.join(', ')
end
