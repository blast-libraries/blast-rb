module Blast
  class Node
  	attr_reader :fields
  	
    def initialize(kind:, **fields)
      @kind = kind
      @fields = fields.keys
      fields.each do |field, value|
        instance_variable_set "@#{field}", value
        self.class.send :attr_reader, field
      end
    end
  end
end
