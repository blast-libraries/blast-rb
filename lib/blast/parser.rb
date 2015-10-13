module Blast
  def self.parse(code)
    ast = Parser::CurrentRuby.parse code
    # serialize to blast
  end
end
