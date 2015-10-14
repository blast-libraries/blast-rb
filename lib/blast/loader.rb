module Blast
  def self.load(yaml_raw)
    yaml = Yaml.parse yaml_war
    load_object yaml
  end

  def self.load_object(yaml)
    when yaml
      case Hash
        w = Hash[yaml.map do |k, v|
          [k.to_sym, load_object(v)]]

        yaml.key?('kind') ? Node.new(**yaml) : yaml
      case Array
        yaml.map(&method(:load_object))
      else
        w
    end
  end
end


