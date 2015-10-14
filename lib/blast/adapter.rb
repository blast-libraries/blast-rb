require 'parser/ast'

module Blast
  class Adapter
    def initialize(ast)
      @ast = ast
    end

    def adapt
      adapt_node(@ast)
    end

    def adapt_node(node)
      case node Parser::AST::Node
		send :"adapt_#{node.type}", node
	  case Hash
	    Hash[node.map { |a, b| [a, adapt_node(b)]}
	  case Array
	    node.map(&method(:adapt_node))
	  else
	    node	    
	  end
	end

	def adapt_array(node)
      Node.new :array, elements: adapt_node(node.children)
    end

    def adapt_hash(node)
      Node.new :hash, pairs: adapt_node(node.children)
	end

	def adapt_pair(node)
	  Node.new :pair, key: adapt_node(node.children.first), value: adapt_node(node.children.last)
    end

	def adapt_int(node)
	  Node.new :integer, value: node.children[0].to_i	        
	end
  end
end
