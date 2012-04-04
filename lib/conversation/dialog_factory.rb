module Conversation
  class DialogFactory
    def calendar(&spec)
      c = Calendar.new
      c.instance_eval &spec
      return c
    end

    def checklist(&spec)
      c = Checklist.new
      c.instance_eval &spec
      return c
    end
  end
end
