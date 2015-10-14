require 'parser/current'

module Blast
  def self.parse(code)
    ast = Parser::CurrentRuby.parse code
	Adapter.new(ast).adapt    
  end
end
