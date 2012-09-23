# Copyright (c) 2012, Peter Allin <peter@peca.dk> All rights reserved.
# See LICENSE file for licensing information.

module Palaver
  class ProgramBox < Palaver::Base
    def initialize(options)
      super(options)
      options.each do |option, value|
        case option
        when :command then self.command(value)
        end
      end
    end

    def command(*c, &block)
      if c.length == 0  then
        @command = nil
        @block = block
      elsif c.length == 1 then
        @command = c[0]
      else
        throw "ProgramBox.command should be called with eiter a command string or a block"
      end
    end

    def show()
      if @command then
        cmd = "dialog #@common_options --prgbox '#@text' '#@command' #@height #@width"
        system cmd
      else
        cmd = "dialog #@common_options --programbox '#@text' #@height #@width"
        IO.popen(cmd, "w") do |f|
          old_stdout = $stdout
          begin
            $stdout = f
            @block.call
            f.close
          ensure
            $stdout = old_stdout
          end
        end
      end
    end

  end
end
