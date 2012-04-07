module Conversation
  class DialogFactory
    def calendar(options={},&spec)
      c = Calendar.new(options)
      c.instance_eval &spec if spec
      return c
    end

    def checklist(options={}, &spec)
      c = Checklist.new(options)
      c.instance_eval &spec if spec
      return c
    end

    def radiolist(options={}, &spec)
      c = Radiolist.new(options)
      c.instance_eval &spec if spec
      return c
    end

    def menu(options={}, &spec)
      c = Menu.new(options)
      c.instance_eval &spec if spec
      return c
    end
  end
end
