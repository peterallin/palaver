module Conversation
  class DialogFactory
    def calendar(options={},&spec)
      c = Calendar.new(options)
      c.instance_eval &spec if spec
      return c
    end

    def checklist(&spec)
      c = Checklist.new
      c.instance_eval &spec
      return c
    end
  end
end
